#!/usr/bin/env python
"""OCR all menu-harga-foto competitor images and extract menu items + prices."""
import easyocr
import json
import os
import re
import sys

BASE = "D:/marsia/skripsi-marsia/resource/05-fieldwork/02-observasi-grabfood/20260619-kompetitor/cropped"

MERCHANTS = {
    "paripurna": {
        "name": "Restoran Paripurna",
        "dir": "paripurna",
        "prefix": "PAR",
        "files": [f"O-KP-20260619-PAR-{i:03d}" for i in range(5, 36) if i != 22],
    },
    "dendeng-batokok": {
        "name": "Rumah Makan Dendeng Batokok",
        "dir": "dendeng-batokok",
        "prefix": "DB",
        "files": [f"O-KP-20260619-DB-{i:03d}" for i in range(13, 31)],
    },
    "istana-krakatau": {
        "name": "Rumah Makan Istana Krakatau",
        "dir": "istana-krakatau",
        "prefix": "IK",
        "files": [f"O-KP-20260619-IK-{i:03d}" for i in range(3, 26)],
    },
    "pondok-gurih": {
        "name": "RM. Pondok Gurih",
        "dir": "pondok-gurih",
        "prefix": "PG",
        "files": [f"O-KP-20260619-PG-{i:03d}" for i in range(5, 23)],
    },
    "garuda": {
        "name": "Restoran Garuda",
        "dir": "restoran-garuda",
        "prefix": "GAR",
        "files": [f"O-KP-20260619-GAR-{i:03d}" for i in range(5, 40)],
    },
}

def parse_ocr_lines(lines):
    """Parse OCR text lines into (item_name, price) pairs.
    
    GrabFood menu screenshots have a pattern:
    - Item name on one line
    - Price (numeric) on a nearby line
    - Sometimes category headers like "9 Vegetarian", "Popular", etc.
    - "Nasi Bungkus" appears as a label before the actual item
    """
    items = []
    
    # Clean lines
    cleaned = []
    for line in lines:
        line = line.strip()
        if not line:
            continue
        cleaned.append(line)
    
    i = 0
    while i < len(cleaned):
        line = cleaned[i]
        
        # Skip merchant name, address, UI elements
        skip_patterns = [
            r'^(Restoran|Rumah Makan|RM\.?)\s',  # merchant names
            r'Group Order',
            r'Vegetarian',
            r'Terlaris',
            r'Ustrast',  # OCR noise for "Terlaris"
            r'Popular',
            r'\+\d',
            r'^\+\s*$',
            r'Pusat',
            r'^[A-Z][a-z]+\s Sikambing',
            r'Centre Point',
            r'Brigjend',
            r'Adam Malik',
            r'Glugur',
            r'lihat semua',
            r'Lihat Semua',
            r'chat',
            r'Chat',
            r'ulasan',
            r'Ulasan',
            r'\d+\s*ulasan',
            r'\d+\s*penilaian',
            r'\d+\.\d+\s*km',
            r'perjalanan',
            r'estimasi',
            r'ESTIMASI',
            r' GRATIS',
            r'gratis',
            r'promo',
            r'Promo',
            r'voucher',
            r'Voucher',
            r'^Rp',  # standalone Rp
            r'pesanan',
            r'Pesanan',
            r'Buka',
            r'Tutup',
            r'buka',
            r'tutup',
            r'^[\d,]+\s*$',  # rating numbers alone
            r'sekitar',
            r'menit',
            r'detik',
            r'^\d+$',  # standalone numbers
        ]
        
        skip = False
        for pat in skip_patterns:
            if re.search(pat, line):
                skip = True
                break
        if skip:
            i += 1
            continue
        
        # Look for price pattern: numbers with dots/thousands separators
        # Price like "24.300", "50.000", "5.000", etc.
        price_match = re.match(r'^(\d{1,3}(?:[.,]\d{3})*(?:[.,]\d{1,2})?)$', line.replace('Rp', '').strip())
        if price_match:
            i += 1
            continue
        
        # Check if this line contains a price embedded
        embedded_price = re.search(r'(\d{1,3}(?:[.,]\d{3})+)\s*$', line)
        if embedded_price:
            name = line[:embedded_price.start()].strip()
            price = embedded_price.group(1)
            if name and len(name) > 1:
                items.append((name, price))
            i += 1
            continue
        
        # Check if next 1-2 lines is a price
        price_found = None
        for j in range(1, min(4, len(cleaned) - i)):
            next_line = cleaned[i + j] if (i + j) < len(cleaned) else ""
            # Direct price match
            pm = re.match(r'^(\d{1,3}(?:\.\d{3})*)$', next_line.strip())
            if pm:
                price_found = pm.group(1)
                break
            # Price with Rp
            pm2 = re.match(r'^Rp\s*(\d{1,3}(?:\.\d{3})*)$', next_line.strip())
            if pm2:
                price_found = pm2.group(1)
                break
            # If next line is another item name, stop
            if not re.match(r'^\d', next_line.strip()):
                break
        
        if price_found:
            items.append((line, price_found))
        
        i += 1
    
    return items

def clean_price(price_str):
    """Convert price string to integer rupiah."""
    # Remove Rp, spaces
    p = price_str.replace('Rp', '').replace(' ', '').replace(',', '.')
    # Handle "5o.000" OCR errors (o -> 0)
    p = p.replace('o', '0').replace('O', '0')
    # Remove trailing decimals that are actually thousands sep issues
    parts = p.split('.')
    if len(parts) > 1:
        # If last part is 3 digits, it's thousands separator
        if len(parts[-1]) == 3:
            return int(''.join(parts))
        elif len(parts[-1]) <= 2:
            # It's a decimal - for rupiah, likely the main number
            return int(parts[0])
    try:
        return int(p.replace('.', ''))
    except:
        return None

def format_price(rp):
    """Format integer to RpXX.XXX format."""
    if rp is None:
        return None
    s = str(rp)
    # Add dots as thousands separators
    result = []
    for i, c in enumerate(reversed(s)):
        if i > 0 and i % 3 == 0:
            result.append('.')
        result.append(c)
    return 'Rp' + ''.join(reversed(result))

def main():
    print("Loading EasyOCR model...", file=sys.stderr)
    reader = easyocr.Reader(['en'], gpu=False)
    print("Model loaded.", file=sys.stderr)
    
    all_data = {}
    
    for key, info in MERCHANTS.items():
        merchant_name = info["name"]
        merchant_dir = info["dir"]
        all_items = []
        
        print(f"\n=== Processing {merchant_name} ({len(info['files'])} files) ===", file=sys.stderr)
        
        for filecode in info["files"]:
            filepath = os.path.join(BASE, merchant_dir, filecode + ".jpeg")
            if not os.path.exists(filepath):
                print(f"  SKIP (not found): {filecode}", file=sys.stderr)
                continue
            
            print(f"  OCR: {filecode}...", file=sys.stderr, end="", flush=True)
            try:
                result = reader.readtext(filepath, detail=0)
                lines = [r.strip() for r in result if r.strip()]
                items = parse_ocr_lines(lines)
                
                for name, price_str in items:
                    rp = clean_price(price_str)
                    all_items.append({
                        "filecode": filecode,
                        "name": name,
                        "price_raw": price_str,
                        "price_int": rp,
                        "price_formatted": format_price(rp),
                    })
                print(f" {len(items)} items", file=sys.stderr)
            except Exception as e:
                print(f" ERROR: {e}", file=sys.stderr)
        
        all_data[key] = {
            "name": merchant_name,
            "items": all_items,
        }
        print(f"  Total items for {merchant_name}: {len(all_items)}", file=sys.stderr)
    
    # Write JSON output
    output_path = "D:/marsia/skripsi-marsia/scripts/ocr_menu_harga_results.json"
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(all_data, f, ensure_ascii=False, indent=2)
    print(f"\nResults written to {output_path}", file=sys.stderr)
    
    # Print summary
    total = 0
    for key, data in all_data.items():
        count = len(data["items"])
        total += count
        print(f"{data['name']}: {count} items")
    print(f"TOTAL: {total} items")

if __name__ == "__main__":
    main()
