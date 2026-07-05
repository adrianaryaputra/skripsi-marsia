\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{skripsi}[2026/04/08 Format Skripsi berdasarkan Panduan 260921]

% Inherit from report class
\LoadClass[12pt, a4paper, oneside]{report}

% -------------------------------------------------------------------
% 1. PACKAGES
% -------------------------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{times} % Times-like font for pdfLaTeX output
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
\RequirePackage[table]{xcolor} % Grayscale table fills and rules
\RequirePackage{tikz} % For conceptual diagrams
\usetikzlibrary{arrows.meta,positioning,shapes.geometric,fit,backgrounds,calc}
\RequirePackage{smartdiagram} % For automatic flow diagrams
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
\RequirePackage{placeins} % Keep floats close to their textual context

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
% Size 12pt is set in LoadClass.
% Line spacing: Double
\doublespacing

% Paragraph Spacing: Before 0 pt, After 0 pt
\setlength{\parskip}{0pt}

% Paragraph Indentation: 1.25 cm
\newlength{\skripsi@normalparindent}
\setlength{\skripsi@normalparindent}{1.25cm}
\setlength{\parindent}{\skripsi@normalparindent}
\setlength{\emergencystretch}{2em}
\raggedbottom

% Disable Widow/Orphan
\clubpenalty=0
\widowpenalty=0
\displaywidowpenalty=0

% Justify alignment is default in LaTeX.
\newcolumntype{Y}{>{\RaggedRight\arraybackslash}X}
\newcommand{\skripsi@headingfont}{\normalfont\normalsize\bfseries}
\newcommand{\skripsi@resetbodyindent}{%
  \par
  \global\leftskip=0pt\relax
  \global\parindent=\skripsi@normalparindent\relax
}
\newcommand{\resetindent}{%
  \par
  \vspace{12pt}%
  \global\leftskip=0pt\relax
  \global\parindent=\skripsi@normalparindent\relax
}

\newcommand{\skripsi@setbodyindent}[1]{%
  \par
  \global\leftskip=#1\relax
  \global\parindent=0pt\relax
}
\newcommand{\skripsi@frontheading}[1]{%
  \begingroup
  \centering
  {\skripsi@headingfont #1\par}%
  \endgroup
  \vspace{12pt}%
}

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
{\normalfont\normalsize\bfseries\centering} % Format (Times-like, 12pt, Bold, Center)
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

% Spacing for SUBBAB: keep before spacing, match paragraph spacing after.
\titlespacing*{\section}{0pt}{12pt}{0pt}

% SUBSUBBAB (1.1.1)
\titleformat{\subsection}
{\normalfont\normalsize\bfseries}
{\thesubsection}
{1em}
{}
\titlespacing*{\subsection}{0pt}{12pt}{0pt}

% SUB-SUBBAB dan level di bawahnya
\newlength{\skripsi@subsubsectionindent}
\newlength{\skripsi@subsubsubsectionindent}
\newlength{\skripsi@subsubsubsubsectionindent}
\newlength{\skripsi@subsubsubsubsubsectionindent}
\newlength{\skripsi@subsubsubsubsubsubsectionindent}
\setlength{\skripsi@subsubsectionindent}{0.625cm}
\setlength{\skripsi@subsubsubsectionindent}{1.25cm}
\setlength{\skripsi@subsubsubsubsectionindent}{1.875cm}
\setlength{\skripsi@subsubsubsubsubsectionindent}{2.5cm}
\setlength{\skripsi@subsubsubsubsubsubsectionindent}{3.125cm}

\setcounter{secnumdepth}{6}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
\renewcommand{\theparagraph}{\alph{paragraph}}
\renewcommand{\thesubparagraph}{\arabic{subparagraph})}
\newcounter{subsubsubsubsubsection}[subparagraph]
\renewcommand{\thesubsubsubsubsubsection}{\alph{subsubsubsubsubsection})}

\titleformat{\subsubsection}
{\normalfont\normalsize\bfseries}
{\makebox[0.625cm][l]{\thesubsubsection.}}
{0pt}
{}
[\skripsi@setbodyindent{\skripsi@subsubsubsectionindent}]
\titlespacing*{\subsubsection}{\skripsi@subsubsectionindent}{12pt}{0pt}

\titleformat{\paragraph}
{\normalfont\normalsize\bfseries}
{\makebox[0.625cm][l]{\theparagraph.}}
{0pt}
{}
[\skripsi@setbodyindent{\skripsi@subsubsubsubsectionindent}]
\titlespacing*{\paragraph}{\skripsi@subsubsubsectionindent}{12pt}{0pt}

\titleformat{\subparagraph}
{\normalfont\normalsize\bfseries}
{\makebox[0.625cm][l]{\thesubparagraph}}
{0pt}
{}
[\skripsi@setbodyindent{\skripsi@subsubsubsubsubsectionindent}]
\titlespacing*{\subparagraph}{\skripsi@subsubsubsubsectionindent}{12pt}{0pt}

\newcommand{\subsubsubsubsubsection}{%
  \@startsection{subsubsubsubsubsection}{6}{\z@}{12pt}{0pt}{\normalfont\normalsize\bfseries}%
}
\titleformat{\subsubsubsubsubsection}
{\normalfont\normalsize\bfseries}
{\makebox[0.625cm][l]{\thesubsubsubsubsubsection}}
{0pt}
{}
[\skripsi@setbodyindent{\skripsi@subsubsubsubsubsubsectionindent}]
\titlespacing*{\subsubsubsubsubsection}{\skripsi@subsubsubsubsubsectionindent}{12pt}{0pt}

\let\subsubsubsection\paragraph
\let\subsubsubsubsection\subparagraph


% -------------------------------------------------------------------
% 5. TABLES AND FIGURES
% -------------------------------------------------------------------
\renewcommand{\tablename}{Tabel}
\renewcommand{\figurename}{Gambar}

% Caption settings and table spacing
\captionsetup[table]{
  font={footnotesize, singlespacing},
  labelfont=bf,
  textfont=bf,
  labelsep=newline,
  justification=centering,
  singlelinecheck=false,
  skip=6pt
}
\captionsetup[figure]{
  font={normalsize, singlespacing},
  labelfont=bf,
  textfont=bf,
  labelsep=newline,
  justification=centering,
  singlelinecheck=false,
  skip=6pt
}

\newcommand{\tablesource}[2][\textwidth]{%
  \par\nointerlineskip\vspace{-7pt}%
  \begingroup
  \normalfont\footnotesize\singlespacing
  \noindent\begin{minipage}{#1}%
    \raggedright Sumber: #2%
  \end{minipage}\par
  \endgroup
}

\newcommand{\figuresource}[2][\textwidth]{%
  \par\nointerlineskip\vspace{-7pt}%
  \begingroup
  \normalfont\footnotesize\singlespacing
  \noindent\makebox[\linewidth][c]{%
    \begin{minipage}{#1}%
      \raggedright Sumber: #2%
    \end{minipage}%
  }\par
  \endgroup
}

% Reset table and figure numbering in each chapter/lampiran
\counterwithin{table}{chapter}
\counterwithin{figure}{chapter}

% Global table spacing so cells are neither too tight nor too loose
\newlength{\tableposttextsep}
\setlength{\LTpre}{6pt}
\setlength{\LTleft}{0pt}
\setlength{\LTright}{0pt}
\setlength{\LTcapwidth}{\textwidth}
\setlength{\extrarowheight}{1.5pt}
\setlength{\heavyrulewidth}{0.08em}
\setlength{\lightrulewidth}{0.05em}
\setlength{\cmidrulewidth}{0.05em}
\newcommand{\skripsi@tableheadcolor}{black!12}
\newcommand{\skripsi@tablerulecolor}{black!60}
\newcolumntype{Z}[1]{>{\columncolor{\skripsi@tableheadcolor}\bfseries\RaggedRight\arraybackslash\hyphenpenalty=10000\exhyphenpenalty=10000\relax}p{#1}}
\newcolumntype{L}[1]{>{\RaggedRight\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{J}{>{\columncolor{\skripsi@tableheadcolor}\bfseries\RaggedRight\arraybackslash\hyphenpenalty=10000\exhyphenpenalty=10000\relax}l}
\newcolumntype{V}{>{\columncolor{\skripsi@tableheadcolor}\bfseries\RaggedRight\arraybackslash\hyphenpenalty=10000\exhyphenpenalty=10000\relax}Y}
\renewcommand{\toprule}{\arrayrulecolor{\skripsi@tablerulecolor}\hline\rowcolor{\skripsi@tableheadcolor}}
\renewcommand{\midrule}{\arrayrulecolor{\skripsi@tablerulecolor}\hline}
\renewcommand{\bottomrule}{\arrayrulecolor{\skripsi@tablerulecolor}\hline}
\renewcommand{\addlinespace}[1][]{}
\AtBeginEnvironment{table}{%
  \singlespacing
  \footnotesize
  \arrayrulecolor{\skripsi@tablerulecolor}%
  \setlength{\tabcolsep}{5pt}%
  \renewcommand{\arraystretch}{1.12}%
}
\AtBeginEnvironment{tabularx}{%
  \footnotesize
  \arrayrulecolor{\skripsi@tablerulecolor}%
}
\AtBeginEnvironment{longtable}{%
  \singlespacing
  \arrayrulecolor{\skripsi@tablerulecolor}%
}

\newcommand{\continuedtabletitle}[1]{%
  \multicolumn{#1}{@{}l@{}}{\textbf{Lanjutan Tabel \thetable}}\\%
}

% Keep table/figure-to-text spacing close to the guide and avoid stretched gaps.
\AtBeginDocument{%
  \setlength{\tableposttextsep}{6pt}%
  \setlength{\LTpost}{0pt}%
  \setlength{\textfloatsep}{\tableposttextsep}%
  \setlength{\intextsep}{\tableposttextsep}%
}

% Let tables follow nearby text while still allowing top/bottom/float pages.
\def\fps@table{!htbp}
\def\fps@figure{!t}
\setcounter{topnumber}{5}
\setcounter{bottomnumber}{0}
\setcounter{totalnumber}{5}
\renewcommand{\topfraction}{0.95}
\renewcommand{\bottomfraction}{0}
\renewcommand{\textfraction}{0.05}
\renewcommand{\floatpagefraction}{0.8}
\setlength{\@fptop}{0pt}
\setlength{\@fpsep}{8pt plus 2pt minus 2pt}
\setlength{\@fpbot}{0pt plus 1fil}

% Spacing before/after floats (tables/figures)
\setlength{\floatsep}{6pt}

\newcommand{\skripsi@addfloattolist}[2]{%
  \begingroup
    \let\@elt\relax
    \xdef\skripsi@fb@tmp{#1\noexpand\@elt\noexpand#2}%
  \endgroup
  \global\let#1\skripsi@fb@tmp
}

\newcommand{\skripsi@splitfloatlist}[3]{%
  \global\let#2\@empty
  \global\let#3\@empty
  \begingroup
    \def\@elt##1{%
      \@tempcnta\count##1\relax
      \divide\@tempcnta\@xxxii
      \ifnum\@tempcnta=\ftype@table\relax
        \skripsi@addfloattolist#2{##1}%
      \else
        \skripsi@addfloattolist#3{##1}%
      \fi
    }%
    #1%
  \endgroup
}

\newcommand{\TableFloatBarrier}{%
  \par
  \begingroup
    \let\@elt\relax
    \skripsi@splitfloatlist{\@botlist}{\skripsi@fb@tablebot}{\skripsi@fb@otherbot}%
    \skripsi@splitfloatlist{\@deferlist}{\skripsi@fb@tabledefer}{\skripsi@fb@otherdefer}%
    \skripsi@splitfloatlist{\@dbldeferlist}{\skripsi@fb@tabledbldefer}{\skripsi@fb@otherdbldefer}%
    \edef\skripsi@fb@tables{\skripsi@fb@tablebot\skripsi@fb@tabledefer\skripsi@fb@tabledbldefer}%
    \ifx\skripsi@fb@tables\@empty
      \global\let\skripsi@fb@needed\@empty
    \else
      \global\let\skripsi@fb@needed\relax
      \global\let\@botlist\skripsi@fb@tablebot
      \global\let\@deferlist\skripsi@fb@tabledefer
      \global\let\@dbldeferlist\skripsi@fb@tabledbldefer
    \fi
  \endgroup
  \ifx\skripsi@fb@needed\@empty
  \else
    \begingroup
      \let\@fb@topbarrier\relax
      \FloatBarrier
    \endgroup
    \begingroup
      \let\@elt\relax
      \xdef\@botlist{\@botlist\skripsi@fb@otherbot}%
      \xdef\@deferlist{\@deferlist\skripsi@fb@otherdefer}%
      \xdef\@dbldeferlist{\@dbldeferlist\skripsi@fb@otherdbldefer}%
    \endgroup
  \fi
}
\AfterEndEnvironment{table}{\TableFloatBarrier}

% -------------------------------------------------------------------
% 6. LISTS (DAFTAR) FORMATTING
% -------------------------------------------------------------------
\newcommand{\listlampiranname}{DAFTAR LAMPIRAN}
\newlistof{lampiran}{loa}{\listlampiranname}
\renewcommand{\thelampiran}{\Alph{lampiran}}

\setlist{nosep, topsep=0pt, partopsep=0pt, parsep=0pt, itemsep=0pt}
\setlist[enumerate,1]{
  label=\arabic*.,
  labelindent=0.75cm,
  labelwidth=0.35cm,
  labelsep=0.15cm,
  leftmargin=!,
  align=left,
  listparindent=0pt
}
\setlist[enumerate,2]{
  label=\alph*.,
  labelindent=0.75cm,
  labelwidth=0.35cm,
  labelsep=0.15cm,
  leftmargin=!,
  align=left,
  listparindent=0pt
}

\renewcommand{\cfttoctitlefont}{\normalsize\bfseries\MakeUppercase}
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
\newlength{\skripsi@listnumwidth}
\newlength{\skripsi@listpageleft}
\newlength{\skripsi@listpagewidth}
\newlength{\skripsi@listtitlewidth}
\newlength{\skripsi@listlinewidth}
\newlength{\skripsi@listtextleft}
\setlength{\skripsi@listtextleft}{\dimexpr 1in+\oddsidemargin\relax}
\setlength{\skripsi@listnumwidth}{\dimexpr 6.25cm-\skripsi@listtextleft\relax}
\setlength{\skripsi@listpagewidth}{\skripsi@tocpnumwidth}
\setlength{\skripsi@listpageleft}{\dimexpr \textwidth-\skripsi@listpagewidth\relax}
\setlength{\skripsi@listtitlewidth}{\dimexpr\skripsi@listpageleft-\skripsi@listnumwidth\relax}
\setlength{\skripsi@listlinewidth}{\dimexpr\skripsi@listpageleft+\skripsi@listpagewidth\relax}
\newcommand{\skripsi@listsinglespacing}{\setstretch{\setspace@singlespace}}
\newcommand{\skripsi@listspacingsetup}{%
  \skripsi@listsinglespacing
  \parskip \z@
}
\newcommand{\skripsi@listheader}[1]{%
  \par\nobreak
  {\normalfont\skripsi@listspacingsetup
    \parskip \z@
    \noindent
    \makebox[\skripsi@listlinewidth][l]{%
      \makebox[\skripsi@listnumwidth][l]{#1}%
      \makebox[\skripsi@listtitlewidth][c]{Judul}%
      \makebox[\skripsi@listpagewidth][r]{Halaman}}\par}%
  \nobreak\vspace{6pt}%
}
\newcommand{\skripsi@afterlisttitle}[1]{%
  \hfill\mbox{}%
  \par\nobreak\vspace{15pt}%
  \skripsi@listheader{#1}%
}
\renewcommand{\cftlottitlefont}{\hfill\normalsize\bfseries\MakeUppercase}
\renewcommand{\cftafterlottitle}{\skripsi@afterlisttitle{No. Tabel}}
\renewcommand{\cftloftitlefont}{\hfill\normalsize\bfseries\MakeUppercase}
\renewcommand{\cftafterloftitle}{\skripsi@afterlisttitle{No. Gambar}}
\renewcommand{\cftloatitlefont}{\hfill\normalsize\bfseries\MakeUppercase}
\renewcommand{\cftafterloatitle}{\skripsi@afterlisttitle{No. Lampiran}}

% Sesuaikan jarak atas daftar dengan jarak pada chapter biasa
\setlength{\cftbeforetoctitleskip}{-20pt}
\setlength{\cftaftertoctitleskip}{0pt}
\setlength{\cftbeforelottitleskip}{-20pt}
\setlength{\cftbeforeloftitleskip}{-20pt}
\setlength{\cftbeforeloatitleskip}{-20pt}
\setlength{\cftafterlottitleskip}{0pt}
\setlength{\cftafterloftitleskip}{0pt}
\setlength{\cftafterloatitleskip}{0pt}
\setlength{\cftfigindent}{0pt}
\setlength{\cfttabindent}{0pt}
\setlength{\cftlampiranindent}{0pt}
\setlength{\cftfignumwidth}{\skripsi@listnumwidth}
\setlength{\cfttabnumwidth}{\skripsi@listnumwidth}
\setlength{\cftlampirannumwidth}{\skripsi@listnumwidth}
\setlength{\cftbeforefigskip}{0pt}
\setlength{\cftbeforetabskip}{0pt}
\setlength{\cftbeforelampiranskip}{0pt}

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
\renewcommand{\cftchapafterpnum}{}

\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % Dots for section
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsubsecleader}{\cftdotfill{\cftdotsep}}
\newcommand{\skripsi@listfillnum}[1]{%
  {\cftdotfill{\cftdotsep}}\nobreak
  \makebox[\skripsi@listpagewidth][r]{\normalfont #1}\par
}
\newcommand{\skripsi@listline}[8]{%
  {\leftskip #2\relax
    \hsize \skripsi@listlinewidth
    \rightskip \skripsi@listpagewidth
    \parskip \z@
    \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \skripsi@listspacingsetup
    \skripsi@toctextsetup
    \leavevmode
    \@tempdima #3\relax
    \let\@cftbsnum #4%
    \let\@cftasnum #5%
    \let\@cftasnumb #6%
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {\normalfont #7}\nobreak
    \skripsi@listfillnum{#8}}%
}
\renewcommand*{\l@figure}[2]{%
  \skripsi@listline{\cftbeforefigskip}{\cftfigindent}{\cftfignumwidth}%
  {\cftfigpresnum}{\cftfigaftersnum}{\cftfigaftersnumb}{#1}{#2}}
\renewcommand*{\l@table}[2]{%
  \skripsi@listline{\cftbeforetabskip}{\cfttabindent}{\cfttabnumwidth}%
  {\cfttabpresnum}{\cfttabaftersnum}{\cfttabaftersnumb}{#1}{#2}}
\renewcommand*{\l@lampiran}[2]{%
  \skripsi@listline{\cftbeforelampiranskip}{\cftlampiranindent}{\cftlampirannumwidth}%
  {\cftlampiranpresnum}{\cftlampiranaftersnum}{\cftlampiranaftersnumb}{#1}{#2}}
\AtBeginDocument{%
  \let\skripsi@origlistoffigures\listoffigures
  \let\skripsi@origlistoftables\listoftables
  \let\skripsi@origlistoflampiran\listoflampiran
  \renewcommand{\listoffigures}{%
    \begingroup
    \skripsi@listspacingsetup
    \let\addvspace\@gobble
    \skripsi@origlistoffigures
    \endgroup}%
  \renewcommand{\listoftables}{%
    \begingroup
    \skripsi@listspacingsetup
    \let\addvspace\@gobble
    \skripsi@origlistoftables
    \endgroup}%
  \renewcommand{\listoflampiran}{%
    \begingroup
    \skripsi@listspacingsetup
    \let\addvspace\@gobble
    \skripsi@origlistoflampiran
    \endgroup}%
}
\newcommand{\cftbabchapfillnum}[1]{%
  {\cftchapleader}\nobreak
  \makebox[\@pnumwidth][\cftpnumalign]{\cftchappagefont #1}\cftchapafterpnum\par
}
\newif\ifskripsi@toclastchapterlike
\skripsi@toclastchapterlikefalse
\newif\ifskripsi@tocafterbabblock
\skripsi@tocafterbabblockfalse

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
    \ifskripsi@tocafterbabblock
      \vskip \cftbeforebabchapskip
    \else
      \vskip \cftbeforechapskip
    \fi
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
    \global\skripsi@toclastchapterlikefalse
    \global\skripsi@tocafterbabblockfalse
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
    \vskip \cftbeforebabchapskip
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
    \global\skripsi@tocafterbabblocktrue
  \fi}

\patchcmd{\@chapter}
{\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}}
{\addcontentsline{toc}{babchapter}{\protect\numberline{BAB \Roman{chapter}}#1}}
{}{}
\patchcmd{\@chapter}
{\addtocontents{lof}{\protect\addvspace{10\p@}}}
{}
{}{}
\patchcmd{\@chapter}
{\addtocontents{lot}{\protect\addvspace{10\p@}}}
{}
{}{}
\pretocmd{\chapter}{\skripsi@resetbodyindent}{}{}
\pretocmd{\section}{\TableFloatBarrier\skripsi@resetbodyindent}{}{}
\pretocmd{\subsection}{\TableFloatBarrier\skripsi@resetbodyindent}{}{}
\pretocmd{\subsubsection}{\TableFloatBarrier\skripsi@resetbodyindent}{}{}
\pretocmd{\paragraph}{\TableFloatBarrier\skripsi@resetbodyindent}{}{}
\pretocmd{\subparagraph}{\TableFloatBarrier\skripsi@resetbodyindent}{}{}
\pretocmd{\subsubsubsubsubsection}{\TableFloatBarrier\skripsi@resetbodyindent}{}{}

\setlength{\bibitemsep}{6pt}
\setlength{\bibhang}{1.25cm}
\defbibheading{skripsibibliography}[\bibname]{%
  \clearpage
  \thispagestyle{plain}%
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}%
  \skripsi@frontheading{\MakeUppercase{#1}}%
}
\AtBeginBibliography{%
  \singlespacing
  \setlength{\parskip}{0pt}%
}

\newcommand{\lampiranentry}[1]{%
  \refstepcounter{lampiran}%
  \addcontentsline{loa}{lampiran}{\protect\numberline{\thelampiran}#1}%
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
    \phantomsection
    \addcontentsline{toc}{chapter}{LAMPIRAN}%
    \skripsi@disableappendixtoc
    \global\skripsi@appendixstartedtrue
    {\centering\normalsize\bfseries LAMPIRAN\par}%
    \vspace{-5pt}%
  \fi
  \lampiranentry{#1}%
  \setcounter{chapter}{\value{lampiran}}% Make \section number start with A, B, C...
  \setcounter{section}{0}%
  \setcounter{table}{0}%
  \setcounter{figure}{0}%
  \renewcommand{\thechapter}{\thelampiran}%
  \thispagestyle{plain}%
  \begingroup
  \singlespacing
  \RaggedRight
  \setlength{\parskip}{0pt}%
  \settowidth{\@tempdima}{\normalsize\bfseries LAMPIRAN \thelampiran{} :\space}%
  \noindent\hangindent=\@tempdima
  \hangafter=1
  {\normalsize\bfseries
    \makebox[\@tempdima][l]{LAMPIRAN \thelampiran{} : }%
    \MakeUppercase{#1}\par}%
  \endgroup
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
  {\normalsize\bfseries
    \setlength{\tabcolsep}{0pt}%
    \begin{tabular}{@{}c@{}}#1\end{tabular}\par}%
}

\newcommand{\makecover}{
  \begin{titlepage}
    \centering
    \singlespacing

    % SKRIPSI
    {\normalsize \textbf{PROPOSAL SKRIPSI}}\\[12pt] % After: 12 (Double)

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
    {\normalsize \textbf{\MakeUppercase{\@kota}}}\\[0pt]
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
  \skripsi@frontheading{ABSTRAK}
  \begingroup
  \centering
  {\singlespacing \bfseries
    \setlength{\tabcolsep}{0pt}%
    \begin{tabular}{@{}c@{}}\judulindonesiacapslocktext\end{tabular}\par}%
  \endgroup
  \vspace{12pt}
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
  \skripsi@frontheading{ABSTRACT}
  \begingroup
  \centering
  {\singlespacing \bfseries
    \setlength{\tabcolsep}{0pt}%
    \begin{tabular}{@{}c@{}}\judulinggriscapslocktext\end{tabular}\par}%
  \endgroup
  \vspace{12pt}
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
  \skripsi@frontheading{KATA PENGANTAR}
  % According to guide: paragraphs spacing double
  \doublespacing
  \setlength{\parindent}{1.25cm}
}{
  \par\vspace{12pt}
  \begingroup
  \singlespacing
  \noindent\hfill
  \begin{tabular}{@{}l@{}}
    \@kota, \ifx\@tanggalpengesahan\@empty\today\else\@tanggalpengesahan\fi \\
    \@labelpenandatangan,                                                   \\
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
  \par
  \endgroup
}

% Initialize Roman Numbering for Frontmatter manually in the main document 
% using \pagenumbering{roman}
\endinput
