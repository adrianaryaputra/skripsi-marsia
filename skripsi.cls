\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{skripsi}[2026/04/08 Format Skripsi berdasarkan Panduan 260921]

% Inherit from report class
\LoadClass[12pt, a4paper, oneside]{report}

% -------------------------------------------------------------------
% 1. PACKAGES
% -------------------------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{times} % Times New Roman
\RequirePackage[
  a4paper,
  top=4cm,
  left=4cm,
  bottom=3cm,
  right=3cm,
  headheight=1.5cm,
  headsep=0.5cm,   % Adjust so header is roughly 2.5cm from top
  footskip=1.5cm   % Footer at 1.5cm from bottom
]{geometry}

\RequirePackage{setspace} % For line spacing
\RequirePackage{titlesec} % For Chapter and Section formatting
\RequirePackage{tocloft}  % For TOC formatting
\RequirePackage{fancyhdr} % For Page Numbering
\RequirePackage{caption}  % For Table and Figure Captions
\RequirePackage{chngcntr} % For resetting float numbering by chapter
\RequirePackage{graphicx} % For Images / Logo
\RequirePackage[style=apa, backend=biber]{biblatex} % APA Style references
\RequirePackage{indentfirst} % Indent first paragraph
\RequirePackage{tabularx}
\RequirePackage{csquotes} % Required by biblatex
\RequirePackage{enumitem} % For list formatting

% -------------------------------------------------------------------
% 1A. BIBLIOGRAPHY LOCALIZATION (INDONESIAN CITATION STYLE)
% -------------------------------------------------------------------
\DefineBibliographyStrings{english}{
  andothers = {dkk\adddot}
}
\DefineBibliographyStrings{american}{
  andothers = {dkk\adddot}
}

% Use "dan" instead of "and"/"&" in citations with two authors
\DeclareDelimFormat[cite]{finalnamedelim}{\addspace dan\space}
\DeclareDelimFormat[textcite]{finalnamedelim}{\addspace dan\space}
\DeclareDelimFormat[parencite]{finalnamedelim}{\addspace dan\space}

% -------------------------------------------------------------------
% 2. FONT & PARAGRAPH SETTINGS
% -------------------------------------------------------------------
% Size 12pt is set in LoadClass. Times New Roman is set via mathptmx.
% Line spacing: Double
\doublespacing

% Paragraph Spacing: Before 0 pt, After 0 pt
\setlength{\parskip}{0pt}

% Paragraph Indentation: 1.25 cm
\setlength{\parindent}{1.25cm}

% Disable Widow/Orphan
\clubpenalty=0
\widowpenalty=0
\displaywidowpenalty=0

% Justify alignment is default in LaTeX.

% -------------------------------------------------------------------
% 3. PAGE STYLES (HEADER & FOOTER)
% -------------------------------------------------------------------
% Style for standard pages (Top of Page, kanan atas)
\fancypagestyle{skripsi_standard}{
  \fancyhf{} % Clear header/footer
  \renewcommand{\headrulewidth}{0pt} % No line
  \renewcommand{\footrulewidth}{0pt}
  \rhead{\thepage} % Page number at top right
}

% Style for Chapter first pages (Bottom of Page, center)
\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \cfoot{\thepage} % Page number at bottom center
}

% Default to standard style
\pagestyle{skripsi_standard}

% -------------------------------------------------------------------
% 4. HEADINGS FORMATTING (BAB & SUBBAB)
% -------------------------------------------------------------------
\renewcommand{\chaptername}{BAB}

% BAB
\titleformat{\chapter}[display]
{\normalfont\large\bfseries\centering} % Format (Times New Roman, Bold, Center)
{\MakeUppercase{\chaptertitlename}~\Roman{chapter}} % "BAB I"
{0pt} % Spacing vertically between "BAB I" and Title
{\MakeUppercase} % Title uppercase

% Spacing for BAB: Before 0, After 12pt (equivalent to Double Spacing)
\titlespacing*{\chapter}{0pt}{-20pt}{12pt}

% SUBBAB (1.1, 1.2, etc.)
\titleformat{\section}
{\normalfont\normalsize\bfseries}
{\thesection}
{1em}
{}

% Spacing for SUBBAB: Before 12pt, After 12pt
\titlespacing*{\section}{0pt}{12pt}{12pt}

% SUBSUBBAB (1.1.1)
\titleformat{\subsection}
{\normalfont\normalsize\bfseries}
{\thesubsection}
{1em}
{}
\titlespacing*{\subsection}{0pt}{12pt}{12pt}

% SUB-SUBBAB (a, b, c)
\setcounter{secnumdepth}{3}
\renewcommand{\thesubsubsection}{\alph{subsubsection}}
\titleformat{\subsubsection}
{\normalfont\normalsize\bfseries}
{\thesubsubsection.}
{1em}
{}
\titlespacing*{\subsubsection}{0pt}{12pt}{12pt}


% -------------------------------------------------------------------
% 5. TABLES AND FIGURES
% -------------------------------------------------------------------
% Caption settings: size 9-10 (footnotesize or small), single spacing
\captionsetup[table]{
  font={small, singlespacing},
  labelsep=space,
  justification=centerlast,
  skip=6pt % Space between caption and table
}
\captionsetup[figure]{
  font={small, singlespacing},
  labelsep=space,
  justification=centerlast,
  skip=6pt
}

% Reset table and figure numbering in each chapter/lampiran
\counterwithin{table}{chapter}
\counterwithin{figure}{chapter}

% Spacing before/after floats (tables/figures)
\setlength{\textfloatsep}{18pt plus 2pt minus 2pt}
\setlength{\floatsep}{12pt plus 2pt minus 2pt}
\setlength{\intextsep}{18pt plus 2pt minus 2pt}

% -------------------------------------------------------------------
% 6. LISTS (DAFTAR) FORMATTING
% -------------------------------------------------------------------
\newcommand{\listlampiranname}{DAFTAR LAMPIRAN}
\newlistof{lampiran}{loa}{\listlampiranname}
\renewcommand{\thelampiran}{\Alph{lampiran}}

\setlist{nosep}

\renewcommand{\cfttoctitlefont}{\hfill\large\bfseries\MakeUppercase}
\renewcommand{\cftaftertoctitle}{\hfill\mbox{}\\[12pt]}
\renewcommand{\cftlottitlefont}{\hfill\large\bfseries\MakeUppercase}
\renewcommand{\cftafterlottitle}{\hfill\mbox{}\\[12pt]}
\renewcommand{\cftloftitlefont}{\hfill\large\bfseries\MakeUppercase}
\renewcommand{\cftafterloftitle}{\hfill\mbox{}\\[12pt]}
\renewcommand{\cftloatitlefont}{\hfill\large\bfseries\MakeUppercase}
\renewcommand{\cftafterloatitle}{\hfill\mbox{}\\[12pt]}

% Sesuaikan jarak atas daftar dengan jarak pada chapter biasa
\setlength{\cftbeforetoctitleskip}{-20pt}
\setlength{\cftbeforelottitleskip}{-20pt}
\setlength{\cftbeforeloftitleskip}{-20pt}
\setlength{\cftbeforeloatitleskip}{-20pt}
\setlength{\cftlampirannumwidth}{6em}

\setlength{\cftbeforesecskip}{6pt}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % Dots for section

\newcommand{\lampiranentry}[1]{%
  \refstepcounter{lampiran}%
  \addcontentsline{loa}{lampiran}{\protect\numberline{Lampiran \thelampiran}#1}%
}

\newcommand{\lampiransection}[1]{%
  \clearpage
  \lampiranentry{#1}%
  \setcounter{chapter}{\value{lampiran}}% Make \section number start with A, B, C...
  \setcounter{section}{0}%
  \setcounter{table}{0}%
  \setcounter{figure}{0}%
  \renewcommand{\thechapter}{\thelampiran}%
  \thispagestyle{plain}%
  \begingroup
    \centering
    {\large\bfseries LAMPIRAN \thelampiran\par}%
    \vspace{12pt}%
    {\large\bfseries \MakeUppercase{#1}\par}%
  \endgroup
  \vspace{12pt}%
  \addcontentsline{toc}{chapter}{LAMPIRAN \thelampiran\space #1}%
}

% -------------------------------------------------------------------
% 7. METADATA VARIABLES (For Cover)
% -------------------------------------------------------------------
\newcommand{\@judulindonesia}{}
\newcommand{\judulindonesia}[1]{%
  \renewcommand{\@judulindonesia}{#1}%
  \title{#1}%
}
\let\judulindo\judulindonesia

\newcommand{\@judulindonesiacapitalize}{}
\newcommand{\judulindonesiacapitalize}[1]{\renewcommand{\@judulindonesiacapitalize}{#1}}
\let\judulindocapitalize\judulindonesiacapitalize

\newcommand{\@judulindonesiacapslock}{}
\newcommand{\judulindonesiacapslock}[1]{\renewcommand{\@judulindonesiacapslock}{#1}}
\let\judulindocapslock\judulindonesiacapslock

\newcommand{\@judulinggris}{}
\newcommand{\judulinggris}[1]{\renewcommand{\@judulinggris}{#1}}
\let\judulenglish\judulinggris

\newcommand{\@judulinggriscapitalize}{}
\newcommand{\judulinggriscapitalize}[1]{\renewcommand{\@judulinggriscapitalize}{#1}}
\let\judulenglishcapitalize\judulinggriscapitalize

\newcommand{\@judulinggriscapslock}{}
\newcommand{\judulinggriscapslock}[1]{\renewcommand{\@judulinggriscapslock}{#1}}
\let\judulenglishcapslock\judulinggriscapslock

\newcommand{\judulindonesiatext}{%
  \ifx\@judulindonesia\@empty
    \@title
  \else
    \@judulindonesia
  \fi
}

\newcommand{\judulindonesiacapitalizetext}{%
  \ifx\@judulindonesiacapitalize\@empty
    \judulindonesiatext
  \else
    \@judulindonesiacapitalize
  \fi
}

\newcommand{\judulindonesiacapslocktext}{%
  \ifx\@judulindonesiacapslock\@empty
    \MakeUppercase{\judulindonesiatext}
  \else
    \@judulindonesiacapslock
  \fi
}

\newcommand{\judulinggristext}{%
  \ifx\@judulinggris\@empty
    \judulindonesiatext
  \else
    \@judulinggris
  \fi
}

\newcommand{\judulinggriscapitalizetext}{%
  \ifx\@judulinggriscapitalize\@empty
    \judulinggristext
  \else
    \@judulinggriscapitalize
  \fi
}

\newcommand{\judulinggriscapslocktext}{%
  \ifx\@judulinggriscapslock\@empty
    \MakeUppercase{\judulinggristext}
  \else
    \@judulinggriscapslock
  \fi
}

\let\judulindotext\judulindonesiatext
\let\judulindocapitalizetext\judulindonesiacapitalizetext
\let\judulindocapslocktext\judulindonesiacapslocktext
\let\judulenglishtext\judulinggristext
\let\judulenglishcapitalizetext\judulinggriscapitalizetext
\let\judulenglishcapslocktext\judulinggriscapslocktext

\newcommand{\@abstrakindonesia}{}
\newcommand{\abstrakindonesia}[1]{\renewcommand{\@abstrakindonesia}{#1}}
\newcommand{\abstrakindonesiatext}{\@abstrakindonesia}

\newcommand{\@katakunciindonesia}{}
\newcommand{\katakunciindonesia}[1]{\renewcommand{\@katakunciindonesia}{#1}}
\newcommand{\katakunciindonesiatext}{\@katakunciindonesia}

\newcommand{\@abstrakinggris}{}
\newcommand{\abstrakinggris}[1]{\renewcommand{\@abstrakinggris}{#1}}
\newcommand{\abstrakinggristext}{\@abstrakinggris}
\let\abstractenglish\abstrakinggris
\let\abstractenglishtext\abstrakinggristext

\newcommand{\@katakunciinggris}{}
\newcommand{\katakunciinggris}[1]{\renewcommand{\@katakunciinggris}{#1}}
\newcommand{\katakunciinggristext}{\@katakunciinggris}
\let\keywordsenglish\katakunciinggris
\let\keywordsenglishtext\katakunciinggristext

\newcommand{\@nim}{}
\newcommand{\nim}[1]{\renewcommand{\@nim}{#1}}

\newcommand{\@programstudi}{}
\newcommand{\programstudi}[1]{\renewcommand{\@programstudi}{#1}}

\newcommand{\@fakultas}{}
\newcommand{\fakultas}[1]{\renewcommand{\@fakultas}{#1}}

\newcommand{\@universitas}{}
\newcommand{\universitas}[1]{\renewcommand{\@universitas}{#1}}

\newcommand{\@tahun}{}
\newcommand{\tahun}[1]{\renewcommand{\@tahun}{#1}}

\newcommand{\@kota}{}
\newcommand{\kota}[1]{\renewcommand{\@kota}{#1}}

\newcommand{\@tanggalpengesahan}{}
\newcommand{\tanggalpengesahan}[1]{\renewcommand{\@tanggalpengesahan}{#1}}

\newcommand{\@labelpenandatangan}{Peneliti}
\newcommand{\labelpenandatangan}[1]{\renewcommand{\@labelpenandatangan}{#1}}

\newcommand{\@namapenandatangan}{}
\newcommand{\namapenandatangan}[1]{\renewcommand{\@namapenandatangan}{#1}}

\newcommand{\@logopath}{}
\newcommand{\logopath}[1]{\renewcommand{\@logopath}{#1}}

\renewcommand{\today}{%
  \ifnum\day<10 0\fi\number\day\space
  \ifcase\month\or
    Januari\or Februari\or Maret\or April\or Mei\or Juni\or
    Juli\or Agustus\or September\or Oktober\or November\or Desember%
  \fi
  \space\number\year
}

% -------------------------------------------------------------------
% 8. COVER PAGE (SAMPUL)
% -------------------------------------------------------------------
\newcommand{\makecover}{
  \begin{titlepage}
    \centering
    \singlespacing

    % SKRIPSI
    {\large \textbf{SKRIPSI}}\\[12pt] % After: 12 (Double)

    % JUDUL (Sampan terbalik requires careful line breaking or centering, 
    % user can format it using \\ in their \title command)
    {\large \textbf{\judulindonesiacapslocktext}}\\[1.5cm]

    % OLEH
    {\normalsize \textbf{OLEH:}}\\[12pt] % 1 enter

    % NAMA
    {\normalsize \textbf{\MakeUppercase{\@author}}}\\[0pt]
    {\normalsize \textbf{NIM. \@nim}}
    
    \vfill

    % LOGO (4.31 cm x 4.31 cm)
    \includegraphics[width=4.31cm, height=4.31cm]{\@logopath}
    \vfill

    % INSTITUTION
    {\normalsize \textbf{\MakeUppercase{PROGRAM STUDI \@programstudi}}}\\[0pt]
    {\normalsize \textbf{\MakeUppercase{FAKULTAS \@fakultas}}}\\[0pt]
    {\normalsize \textbf{\MakeUppercase{\@universitas}}}\\[0pt]
    {\normalsize \textbf{\@tahun}}
  \end{titlepage}
}

% -------------------------------------------------------------------
% 9. FRONTMATTER ENVIRONMENTS
% -------------------------------------------------------------------
% ABSTRAK (Indonesia)
\newenvironment{abstrak}{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{ABSTRAK}
  \def\@keywordlabel{Kata Kunci}
  \begingroup
    \centering
    {\large \textbf{ABSTRAK}}\par\vspace{12pt}
    {\singlespacing \textbf{\judulindonesiacapslocktext}\par}\vspace{12pt}
  \endgroup
  \begin{singlespace}
  \setlength{\parindent}{0pt}
}{
  \end{singlespace}
}

% ABSTRACT (English)
\newenvironment{abstracteng}{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{ABSTRACT}
  \def\@keywordlabel{Keywords}
  \begingroup
    \centering
    {\large \textbf{ABSTRACT}}\par\vspace{12pt}
    {\singlespacing \textbf{\judulinggriscapitalizetext}\par}\vspace{12pt}
  \endgroup
  \begin{singlespace}
  \setlength{\parindent}{0pt}
}{
  \end{singlespace}
}

% KATA KUNCI (For both)
\newcommand{\katakunci}[1]{
  \par\vspace{12pt}
  \noindent
  \makebox[2.75cm][l]{\textbf{\@keywordlabel:}}%
  \parbox[t]{\dimexpr\textwidth-2.75cm\relax}{#1}\par
}

% KATA PENGANTAR
\newenvironment{katapengantar}{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{KATA PENGANTAR}
  \begingroup
    \centering
    {\large \textbf{KATA PENGANTAR}}\par\vspace{12pt}
  \endgroup
  % According to guide: paragraphs spacing double
  \doublespacing
  \setlength{\parindent}{1.25cm}
}{
  \vspace{12pt}
  \begin{flushright}
    \@kota, \ifx\@tanggalpengesahan\@empty\today\else\@tanggalpengesahan\fi\par
    \@labelpenandatangan\par
    \ifx\@namapenandatangan\@empty\else
      \vspace{4\baselineskip}
      \@namapenandatangan\par
    \fi
  \end{flushright}
}

% Initialize Roman Numbering for Frontmatter manually in the main document 
% using \pagenumbering{roman}
\endinput
