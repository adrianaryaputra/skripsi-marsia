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
\RequirePackage{microtype} % Reduce overfull boxes in justified paragraphs
\RequirePackage{titlesec} % For Chapter and Section formatting
\RequirePackage{tocloft}  % For TOC formatting
\RequirePackage{fancyhdr} % For Page Numbering
\RequirePackage{caption}  % For Table and Figure Captions
\RequirePackage{chngcntr} % For resetting float numbering by chapter
\RequirePackage{graphicx} % For Images / Logo
\RequirePackage{tikz} % For conceptual diagrams
\usetikzlibrary{arrows.meta,positioning,shapes.geometric}
\RequirePackage{longtable} % For multi-page tables
\RequirePackage{pdflscape} % For landscape pages
\RequirePackage[style=apa, backend=biber]{biblatex} % APA Style references
\RequirePackage{indentfirst} % Indent first paragraph
\RequirePackage{tabularx}
\RequirePackage{booktabs} % Cleaner table rules ala jurnal
\RequirePackage{ragged2e} % Better ragged text in narrow table columns
\RequirePackage{csquotes} % Required by biblatex
\RequirePackage{enumitem} % For list formatting
\RequirePackage{etoolbox} % For consistent environment-level table styling

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
\setlength{\emergencystretch}{2em}

% Disable Widow/Orphan
\clubpenalty=0
\widowpenalty=0
\displaywidowpenalty=0

% Justify alignment is default in LaTeX.
\newcolumntype{Y}{>{\RaggedRight\arraybackslash}X}

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
\renewcommand{\tablename}{Tabel}
\renewcommand{\figurename}{Gambar}

% Caption settings and table spacing
\captionsetup[table]{
  font={small, singlespacing},
  labelfont=bf,
  textfont=bf,
  labelsep=newline,
  justification=centerlast,
  skip=9pt
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

% Global table spacing so cells are neither too tight nor too loose
\newlength{\tableposttextsep}
\setlength{\LTpre}{12pt}
\setlength{\LTleft}{0pt}
\setlength{\LTright}{0pt}
\setlength{\LTcapwidth}{\textwidth}
\setlength{\extrarowheight}{1.5pt}
\setlength{\heavyrulewidth}{0.08em}
\setlength{\lightrulewidth}{0.05em}
\setlength{\cmidrulewidth}{0.05em}

\AtBeginEnvironment{table}{%
  \singlespacing
  \setlength{\tabcolsep}{5pt}%
  \renewcommand{\arraystretch}{1.12}%
}
\AtBeginEnvironment{tabularx}{%
  \small
}
\AtBeginEnvironment{longtable}{%
  \small
  \singlespacing
  \setlength{\tabcolsep}{4.5pt}%
  \renewcommand{\arraystretch}{1.12}%
}

\newcommand{\continuedtabletitle}[1]{%
  \multicolumn{#1}{@{}l@{}}{\textbf{Lanjutan Tabel \thetable}}\\%
}

% Spacing after tables to the next body paragraph:
% double-spaced body text with paragraph spacing before 0 pt and after 6 pt.
\AtBeginDocument{%
  \setlength{\tableposttextsep}{\dimexpr\baselineskip + 6pt\relax}%
  \setlength{\LTpost}{\tableposttextsep}%
  \setlength{\textfloatsep}{\tableposttextsep}%
  \setlength{\intextsep}{\tableposttextsep}%
}

% Spacing before/after floats (tables/figures)
\setlength{\floatsep}{12pt}

% -------------------------------------------------------------------
% 6. LISTS (DAFTAR) FORMATTING
% -------------------------------------------------------------------
\newcommand{\listlampiranname}{DAFTAR LAMPIRAN}
\newlistof{lampiran}{loa}{\listlampiranname}
\renewcommand{\thelampiran}{\Alph{lampiran}}

\setlist{nosep}

\renewcommand{\cfttoctitlefont}{\large\bfseries\MakeUppercase}
\newlength{\skripsi@tocheaderwidth}
\setlength{\skripsi@tocheaderwidth}{2cm}
\newlength{\skripsi@tocpnumwidth}
\setlength{\skripsi@tocpnumwidth}{0.9cm}
\newlength{\skripsi@tocwrapreserve}
\setlength{\skripsi@tocwrapreserve}{0.18cm}
\newlength{\skripsi@tocsubsecwrapreserve}
\setlength{\skripsi@tocsubsecwrapreserve}{0.75cm}
\newlength{\skripsi@tocsubsubsecwrapreserve}
\setlength{\skripsi@tocsubsubsecwrapreserve}{0.95cm}
\newlength{\skripsi@tocrmarg}
\setlength{\skripsi@tocrmarg}{0pt}
\renewcommand{\cftaftertoctitle}{%
  \par\nobreak
  \vspace{12pt}%
  {\singlespacing
   \noindent\makebox[\textwidth][r]{\hspace*{-\skripsi@tocrmarg}\makebox[\skripsi@tocheaderwidth][r]{Halaman}}\par}%
  \nobreak\vspace{6pt}%
}
\renewcommand{\@cftmaketoctitle}{%
  \addpenalty\@secpenalty
  \if@cfthaschapter
    \vspace*{\cftbeforetoctitleskip}%
  \else
    \vspace{\cftbeforetoctitleskip}%
  \fi
  \@cftpagestyle
  {\interlinepenalty\@M
   \noindent\makebox[0pt][l]{%
     \hspace*{-\dimexpr 1in+\oddsidemargin\relax}%
     \makebox[\paperwidth][c]{{\cfttoctitlefont\contentsname}}}%
   \par
   \cftaftertoctitle
   \cftmarktoc
   \par\nobreak
   \vskip \cftaftertoctitleskip
   \@afterheading}}
\renewcommand{\cftlottitlefont}{\hfill\large\bfseries\MakeUppercase}
\renewcommand{\cftafterlottitle}{\hfill\mbox{}\\[12pt]}
\renewcommand{\cftloftitlefont}{\hfill\large\bfseries\MakeUppercase}
\renewcommand{\cftafterloftitle}{\hfill\mbox{}\\[12pt]}
\renewcommand{\cftloatitlefont}{\hfill\large\bfseries\MakeUppercase}
\renewcommand{\cftafterloatitle}{\hfill\mbox{}\\[12pt]}

% Sesuaikan jarak atas daftar dengan jarak pada chapter biasa
\setlength{\cftbeforetoctitleskip}{-20pt}
\setlength{\cftaftertoctitleskip}{0pt}
\setlength{\cftbeforelottitleskip}{-20pt}
\setlength{\cftbeforeloftitleskip}{-20pt}
\setlength{\cftbeforeloatitleskip}{-20pt}
\setlength{\cftlampirannumwidth}{6em}

\cftsetpnumwidth{\skripsi@tocpnumwidth}
\cftsetrmarg{\skripsi@tocrmarg}

\setlength{\cftchapindent}{0pt}
\setlength{\cftchapnumwidth}{2cm}
\setlength{\cftsecindent}{2cm}
\setlength{\cftsecnumwidth}{1cm}
\setlength{\cftsubsecindent}{3cm}
\setlength{\cftsubsecnumwidth}{1.15cm}
\setlength{\cftsubsubsecindent}{3.5cm}
\setlength{\cftsubsubsecnumwidth}{0.95cm}

\setlength{\cftbeforechapskip}{0pt}
\newlength{\cftbeforebabchapskip}
\setlength{\cftbeforebabchapskip}{6pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftbeforesubsubsecskip}{0pt}

\renewcommand{\cftchapfont}{\normalfont\bfseries}
\renewcommand{\cftchappagefont}{\normalfont\bfseries}
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsubsecfont}{\normalfont}
\renewcommand{\cftsubsecpagefont}{\normalfont}
\renewcommand{\cftsubsubsecfont}{\normalfont}
\renewcommand{\cftsubsubsecpagefont}{\normalfont}
\renewcommand{\cftdotsep}{2}
\renewcommand{\cftchapaftersnum}{\hspace{0.45em}}
\renewcommand{\cftsecaftersnum}{\hspace{0.35em}}
\renewcommand{\cftsubsecaftersnum}{\hspace{0.15em}}
\renewcommand{\cftsubsubsecaftersnum}{\hspace{0.35em}}
\renewcommand{\cftchapafterpnum}{\vskip 6pt}

\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % Dots for section
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsubsecleader}{\cftdotfill{\cftdotsep}}
\newcommand{\cftbabchapfillnum}[1]{%
  {\cftchapleader}\nobreak
  \makebox[\@pnumwidth][\cftpnumalign]{\cftchappagefont #1}\cftchapafterpnum\par
}
\newif\ifskripsi@toclastchapterlike
\skripsi@toclastchapterlikefalse

\newcommand{\skripsi@toctextsetup}{%
  \finalhyphendemerits=100000\relax
  \doublehyphendemerits=100000\relax
  \adjdemerits=10000\relax
  \tolerance=2000\relax
  \emergencystretch=1em\relax
}

\renewcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip \cftbeforechapskip
    {\leftskip \cftchapindent\relax
     \rightskip \@tocrmarg
     \parfillskip -\rightskip
     \parindent \cftchapindent\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima \cftchapnumwidth\relax
     \let\@cftbsnum \cftchappresnum
     \let\@cftasnum \cftchapaftersnum
     \let\@cftasnumb \cftchapaftersnumb
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {\cftchapfont #1}\nobreak
     \cftchapfillnum{#2}}%
    \global\skripsi@toclastchapterliketrue
  \fi}

\renewcommand*{\l@section}[2]{%
  \ifnum \c@tocdepth >\z@
    \if@cfthaschapter
      \vskip \cftbeforesecskip
    \else
      \addpenalty\@secpenalty
      \addvspace{\cftbeforesecskip}
    \fi
    {\leftskip \cftsecindent\relax
     \rightskip \dimexpr\@pnumwidth+\skripsi@tocwrapreserve\relax
     \parfillskip -\rightskip
     \parindent \cftsecindent\relax\@afterindenttrue
     \interlinepenalty\@M
     \skripsi@toctextsetup
     \leavevmode
     \@tempdima \cftsecnumwidth\relax
     \let\@cftbsnum \cftsecpresnum
     \let\@cftasnum \cftsecaftersnum
     \let\@cftasnumb \cftsecaftersnumb
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {\cftsecfont #1}\nobreak
     \cftsecfillnum{#2}}%
    \global\skripsi@toclastchapterlikefalse
  \fi}

\renewcommand*{\l@subsection}[2]{%
  \ifnum \c@tocdepth >\@ne
    \vskip \cftbeforesubsecskip
    {\leftskip \cftsubsecindent\relax
     \rightskip \dimexpr\@pnumwidth+\skripsi@tocsubsecwrapreserve\relax
     \parfillskip -\rightskip
     \parindent \cftsubsecindent\relax\@afterindenttrue
     \interlinepenalty\@M
     \skripsi@toctextsetup
     \leavevmode
     \@tempdima \cftsubsecnumwidth\relax
     \let\@cftbsnum \cftsubsecpresnum
     \let\@cftasnum \cftsubsecaftersnum
     \let\@cftasnumb \cftsubsecaftersnumb
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {\cftsubsecfont #1}\nobreak
     \cftsubsecfillnum{#2}}%
    \global\skripsi@toclastchapterlikefalse
  \fi}

\renewcommand*{\l@subsubsection}[2]{%
  \ifnum \c@tocdepth >\tw@
    \vskip \cftbeforesubsubsecskip
    {\leftskip \cftsubsubsecindent\relax
     \rightskip \dimexpr\@pnumwidth+\skripsi@tocsubsubsecwrapreserve\relax
     \parfillskip -\rightskip
     \parindent \cftsubsubsecindent\relax\@afterindenttrue
     \interlinepenalty\@M
     \skripsi@toctextsetup
     \leavevmode
     \@tempdima \cftsubsubsecnumwidth\relax
     \let\@cftbsnum \cftsubsubsecpresnum
     \let\@cftasnum \cftsubsubsecaftersnum
     \let\@cftasnumb \cftsubsubsecaftersnumb
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {\cftsubsubsecfont #1}\nobreak
     \cftsubsubsecfillnum{#2}}%
    \global\skripsi@toclastchapterlikefalse
  \fi}

\newcommand*{\l@babchapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \ifskripsi@toclastchapterlike\else\vskip \cftbeforebabchapskip\fi
    {\leftskip \cftchapindent\relax
     \rightskip \@tocrmarg
     \parfillskip -\rightskip
     \parindent \cftchapindent\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima \cftchapnumwidth\relax
     \let\@cftbsnum \cftchappresnum
     \let\@cftasnum \cftchapaftersnum
     \let\@cftasnumb \cftchapaftersnumb
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {\cftchapfont #1}\nobreak
     \cftbabchapfillnum{#2}}%
    \global\skripsi@toclastchapterliketrue
  \fi}

\patchcmd{\@chapter}
  {\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}}
  {\addcontentsline{toc}{babchapter}{\protect\numberline{BAB \Roman{chapter}}#1}}
  {}{}

\newcommand{\lampiranentry}[1]{%
  \refstepcounter{lampiran}%
  \addcontentsline{loa}{lampiran}{\protect\numberline{Lampiran \thelampiran}#1}%
}
\newif\ifskripsi@appendixstarted
\skripsi@appendixstartedfalse
\let\skripsi@origaddcontentsline\addcontentsline
\newcommand{\skripsi@disableappendixtoc}{%
  \renewcommand{\addcontentsline}[3]{%
    \ifstrequal{##1}{toc}{}{%
      \skripsi@origaddcontentsline{##1}{##2}{##3}%
    }%
  }%
}

\newcommand{\lampiransection}[1]{%
  \clearpage
  \ifskripsi@appendixstarted\else
    \addcontentsline{toc}{chapter}{LAMPIRAN}%
    \skripsi@disableappendixtoc
    \global\skripsi@appendixstartedtrue
  \fi
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
\newcommand{\covertitleblock}[1]{%
  {\large\bfseries
   \setlength{\tabcolsep}{0pt}%
   \begin{tabular}{@{}c@{}}#1\end{tabular}\par}%
}

\newcommand{\makecover}{
  \begin{titlepage}
    \centering
    \singlespacing

    % SKRIPSI
    {\large \textbf{SKRIPSI}}\\[12pt] % After: 12 (Double)

    % JUDUL (Sampan terbalik requires careful line breaking or centering, 
    % user can format it using \\ in their \title command)
    \covertitleblock{\judulindonesiacapslocktext}\vspace{1.5cm}

    % OLEH
    {\normalsize \textbf{OLEH}}\\[12pt] % 1 enter

    % NAMA
    {\normalsize \textbf{\MakeUppercase{\@author}}}\\[0pt]
    {\normalsize \textbf{\@nim}}

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
  {\singlespacing \textbf{\judulinggriscapslocktext}\par}\vspace{12pt}
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
  % \par\vfill
  \\
  \begin{flushright}
    \singlespacing
    \begin{tabular}{@{}l@{}}
      \@kota, \ifx\@tanggalpengesahan\@empty\today\else\@tanggalpengesahan\fi \\
      \@labelpenandatangan, \\
      \ifx\@namapenandatangan\@empty\else
        \\
        \\
        \\
        \\
        \@namapenandatangan
      \fi
      \ifx\@nim\@empty\else
        \\
        NIM: \@nim
      \fi
    \end{tabular}
  \end{flushright}
}

% Initialize Roman Numbering for Frontmatter manually in the main document 
% using \pagenumbering{roman}
\endinput
