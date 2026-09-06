\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jomas}[2026/09/06 Document Class for Journal of Management Analytical and Solution (JoMAS)]

% -------------------------------------------------------------------
% 1. BASE CLASS & GEOMETRY (US Letter, 1 inch margins)
% -------------------------------------------------------------------
\LoadClass[11pt, letterpaper, oneside]{article}

\RequirePackage[
  letterpaper,
  top=1in,
  bottom=1in,
  left=1in,
  right=1in,
  headheight=14.5pt,
  headsep=12pt,
  footskip=24pt
]{geometry}

% -------------------------------------------------------------------
% 2. TYPOGRAPHY & ENCODING (Times New Roman, 11pt Body)
% -------------------------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{times} % Times New Roman font
\RequirePackage{microtype}
\RequirePackage{setspace}
\singlespacing % Line spacing: 1.0 (Single)

% Paragraph indentation & spacing: No first-line indent, 6pt between paragraphs
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt}

% -------------------------------------------------------------------
% 3. ESSENTIAL PACKAGES
% -------------------------------------------------------------------
\RequirePackage{titlesec}
\RequirePackage{float}
\RequirePackage{tikz}
\usetikzlibrary{positioning,arrows.meta}
\RequirePackage{pgfplots}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{csquotes}
\RequirePackage{enumitem}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
\RequirePackage[style=apa, backend=biber]{biblatex}

% Compact list formatting
\setlist{nosep, leftmargin=1.5em, itemsep=3pt, topsep=3pt}

% -------------------------------------------------------------------
% 4. SECTION HEADING FORMATTING (ALL CAPS, Bold, TNR 12pt)
% -------------------------------------------------------------------
\titleformat{\section}
  {\fontsize{12}{14}\bfseries\upshape}
  {}
  {0pt}
  {\MakeUppercase}

\titlespacing*{\section}
  {0pt}
  {14pt plus 2pt minus 2pt}
  {6pt plus 1pt minus 1pt}

\titleformat{\subsection}
  {\fontsize{11}{13}\bfseries\upshape}
  {}
  {0pt}
  {}

\titlespacing*{\subsection}
  {0pt}
  {10pt plus 2pt minus 1pt}
  {4pt plus 1pt minus 1pt}

\titleformat{\subsubsection}
  {\fontsize{11}{13}\bfseries\itshape}
  {}
  {0pt}
  {}

\titlespacing*{\subsubsection}
  {0pt}
  {8pt plus 2pt minus 1pt}
  {3pt plus 1pt minus 1pt}

% -------------------------------------------------------------------
% 5. HEADER & FOOTER
% -------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[C]{\fontsize{10}{12}\selectfont\thepage}

% -------------------------------------------------------------------
% 6. METADATA COMMANDS (TITLE, AUTHORS, AFFILIATIONS)
% -------------------------------------------------------------------
\newcommand{\arttitle}[1]{\def\@arttitle{#1}}
\newcommand{\artauthors}[1]{\def\@artauthors{#1}}
\newcommand{\artaffiliations}[1]{\def\@artaffiliations{#1}}
\newcommand{\artemail}[1]{\def\@artemail{#1}}

% Clean header block with NO vertical spacing between author, affiliations, and emails
\newcommand{\makejomasheader}{%
  \begin{center}
    {\fontsize{14}{17}\bfseries \@arttitle \par}
    \vspace{12pt}
    {\fontsize{10}{12}\selectfont \setlength{\parskip}{0pt}%
      \@artauthors\par
      \@artaffiliations\par
      \@artemail\par
    }
  \end{center}
  \vspace{12pt}
}

% -------------------------------------------------------------------
% 7. ABSTRACT ENVIRONMENT (ENGLISH ONLY, MAX 160 WORDS)
% -------------------------------------------------------------------
\renewenvironment{abstract}{%
  \vspace{6pt}
  {\noindent\fontsize{12}{14}\bfseries ABSTRACT\par}
  \vspace{6pt}
  \fontsize{11}{13}\selectfont
}{%
  \par
}

\newcommand{\keywords}[1]{%
  \vspace{4pt}
  \noindent{\fontsize{11}{13}\selectfont\textbf{Keywords:} #1\par}
}

% -------------------------------------------------------------------
% 8. TABLES & FIGURES FORMATTING
% -------------------------------------------------------------------
\DeclareCaptionFont{captionfont}{\fontsize{10}{12}\bfseries}
\captionsetup[table]{
  font=captionfont,
  labelfont=captionfont,
  labelsep=period,
  skip=6pt,
  justification=justified,
  singlelinecheck=false
}
\captionsetup[figure]{
  font=captionfont,
  labelfont=captionfont,
  labelsep=period,
  skip=6pt,
  justification=justified,
  singlelinecheck=false
}
\captionsetup[sub]{
  font=small,
  labelfont=bf,
  labelsep=period,
  skip=4pt
}

% End of Class
\endinput
