#!/usr/bin/env python
"""Clean OCR results, deduplicate, and generate LaTeX table."""
import json
import re

# Known noise/garbage item names from OCR to filter
NOISE_NAMES = {
    "Groo",  # OCR noise
    "Ustrast",  # OCR noise for "Terlaris"  
    "Terlaris",
    "Popular",
    "Vegetarian",
    "Pergedel",  # keep this - it's "Perkedel"
}

# Name corrections (OCR misreads -> correct)
NAME_CORRECTIONS = {
    "Pergedel": "Perkedel",
    "Groo": None,  # discard
}

# Merchant display names
MERCHANT_NAMES = {
    "paripurna": "Restoran Paripurna",
    "dendeng-batokok": "Rumah Makan Dendeng Batokok",
    "istana-krakatau": "Rumah Makan Istana Krakatau",
    "pondok-gurih": "RM. Pondok Gurih",
    "garuda": "Restoran Garuda",
}

# Expected price ranges for sanity-check filtering
PRICE_RANGES = {
    "paripurna": (5000, 66000),
    "dendeng-batokok": (5000, 36000),
    "istana-krakatau": (9000, 300000),
    "pondok-gurih": (6000, 250000),
    "garuda": (14000, 270000),
}

def is_valid_item(name, price_int, merchant_key):
    """Check if an item is valid (not noise/garbage)."""
    if not name or len(name) < 2:
        return False
    
    # Skip pure number names
    if re.match(r'^\d+$', name):
        return False
    
    # Skip names that are just UI elements
    ui_patterns = [
        r'^Nasi Bungkus\s*\+?\s*$',  # just "Nasi Bungkus" or "Nasi Bungkus +"
        r'^\+\s*$',
        r'^Rp',
        r'Terlaris',
        r'^Popular$',
        r'Vegetarian',
        r'^Pusat$',
        r'Group Order',
        r'Lihat Semua',
        r'lihat semua',
        r'^\d+\s',
        r'Tambah',
        r'tambah',
        r'Pesan',
        r'pesan',
    ]
    for pat in ui_patterns:
        if re.match(pat, name, re.IGNORECASE):
            return False
    
    # Skip if name is just a price number
    if re.match(r'^[\d.,]+$', name):
        return False
    
    # Price sanity check - allow some tolerance
    if price_int is None:
        return False
    min_p, max_p = PRICE_RANGES[merchant_key]
    # Allow 50% tolerance on both ends
    if price_int < min_p * 0.3 or price_int > max_p * 1.5:
        return False
    
    return True

def clean_name(name):
    """Clean up OCR artifacts in item names."""
    # Remove leading/trailing whitespace
    name = name.strip()
    
    # Apply known corrections
    if name in NAME_CORRECTIONS:
        return NAME_CORRECTIONS[name]
    
    # Remove trailing "+"
    name = re.sub(r'\s+\+$', '', name)
    
    # Capitalize first letter of each word (fix OCR lowercase issues)
    name = name.title()
    
    # Fix common Indonesian title-case issues from .title()
    name = re.sub(r'\bDingin\b', 'Dingin', name)  # already correct
    name = re.sub(r'\bNs\b', 'NS', name)  # abbreviation
    name = re.sub(r'\bRp\b', 'Rp', name)
    
    return name

def deduplicate_items(items):
    """Remove exact duplicates (same name + price)."""
    seen = set()
    result = []
    for item in items:
        key = (item["name"].lower(), item["price_int"])
        if key not in seen:
            seen.add(key)
            result.append(item)
    return result

def escape_latex(text):
    """Escape special LaTeX characters."""
    text = text.replace('&', r'\&')
    text = text.replace('%', r'\%')
    text = text.replace('_', r'\_')
    text = text.replace('#', r'\#')
    text = text.replace('$', r'\$')
    return text

def format_price(rp):
    """Format integer to RpXX.XXX format."""
    s = str(rp)
    result = []
    for i, c in enumerate(reversed(s)):
        if i > 0 and i % 3 == 0:
            result.append('.')
        result.append(c)
    return 'Rp' + ''.join(reversed(result))

def main():
    with open("D:/marsia/skripsi-marsia/scripts/ocr_menu_harga_results.json", 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    all_merchants = {}
    total_items = 0
    
    for merchant_key, merchant_data in data.items():
        raw_items = merchant_data["items"]
        
        # Filter and clean
        valid_items = []
        for item in raw_items:
            name = clean_name(item["name"])
            price_int = item["price_int"]
            
            if name is None:  # discarded by correction
                continue
                
            if is_valid_item(name, price_int, merchant_key):
                valid_items.append({
                    "name": name,
                    "price_int": price_int,
                    "price_formatted": format_price(price_int),
                })
        
        # Deduplicate
        unique_items = deduplicate_items(valid_items)
        
        # Sort by price ascending
        unique_items.sort(key=lambda x: x["price_int"])
        
        all_merchants[merchant_key] = {
            "name": MERCHANT_NAMES[merchant_key],
            "items": unique_items,
        }
        
        print(f"{MERCHANT_NAMES[merchant_key]}: {len(raw_items)} raw -> {len(valid_items)} valid -> {len(unique_items)} unique")
        total_items += len(unique_items)
    
    print(f"\nTOTAL unique items: {total_items}")
    
    # Generate LaTeX
    latex_lines = []
    latex_lines.append(r"\begingroup")
    latex_lines.append(r"\scriptsize")
    latex_lines.append(r"\setlength{\tabcolsep}{3pt}")
    latex_lines.append(r"\renewcommand{\arraystretch}{1.1}")
    latex_lines.append("")
    latex_lines.append(r"\begin{longtable}{|C{0.6cm}|L{3.2cm}|L{4.8cm}|C{2cm}|}")
    latex_lines.append(r"\caption{Daftar Menu dan Harga Kompetitor GrabFood}")
    latex_lines.append(r"\label{tab:harga-kompetitor-lengkap} \\")
    latex_lines.append(r"\hline")
    latex_lines.append(r"\rowcolor{black!10}")
    latex_lines.append(r"\textbf{No.} & \textbf{Merchant} & \textbf{Nama Menu} & \textbf{Harga} \\")
    latex_lines.append(r"\hline")
    latex_lines.append(r"\endfirsthead")
    latex_lines.append("")
    latex_lines.append(r"\multicolumn{4}{l}{\footnotesize\textit{Lanjutan Tabel \ref{tab:harga-kompetitor-lengkap}}} \\")
    latex_lines.append(r"\hline")
    latex_lines.append(r"\rowcolor{black!10}")
    latex_lines.append(r"\textbf{No.} & \textbf{Merchant} & \textbf{Nama Menu} & \textbf{Harga} \\")
    latex_lines.append(r"\hline")
    latex_lines.append(r"\endhead")
    latex_lines.append("")
    latex_lines.append(r"\hline")
    latex_lines.append(r"\multicolumn{4}{r}{\textit{Bersambung ke halaman berikutnya}} \\")
    latex_lines.append(r"\endfoot")
    latex_lines.append("")
    latex_lines.append(r"\hline")
    latex_lines.append(r"\endlastfoot")
    latex_lines.append("")
    
    merchant_order = [
        "paripurna",
        "dendeng-batokok",
        "istana-krakatau",
        "pondok-gurih",
        "garuda",
    ]
    
    item_no = 0
    for merchant_key in merchant_order:
        merchant = all_merchants[merchant_key]
        merchant_name = merchant["name"]
        items = merchant["items"]
        
        if not items:
            continue
        
        # Merchant header row
        latex_lines.append(r"\multicolumn{4}{|c|}{\cellcolor{black!10}\textbf{" + escape_latex(merchant_name) + r"}} \\")
        latex_lines.append(r"\hline")
        
        for item in items:
            item_no += 1
            name_esc = escape_latex(item["name"])
            price_esc = escape_latex(item["price_formatted"])
            latex_lines.append(f"{item_no} & {escape_latex(merchant_name)} & {name_esc} & {price_esc} \\\\")
            latex_lines.append(r"\hline")
        
        latex_lines.append("")
    
    latex_lines.append(r"\multicolumn{4}{|l|}{\textit{Sumber: Observasi GrabFood, 19--20 Juni 2026}} \\")
    latex_lines.append(r"\hline")
    latex_lines.append(r"\end{longtable}")
    latex_lines.append(r"\endgroup")
    
    # Write LaTeX file
    output_path = "D:/marsia/skripsi-marsia/appendices/generated/01b-tabel-harga-kompetitor.tex"
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(latex_lines))
    
    print(f"\nLaTeX file written to: {output_path}")
    print(f"Total lines: {len(latex_lines)}")

if __name__ == "__main__":
    main()
