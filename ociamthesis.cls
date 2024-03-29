%
% ociamthesis v2.2
% By Keith A. Gillow <gillow@maths.ox.ac.uk>
% Version 1.0 released 26/11/1997
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ociamthesis}[2010/11/22 v2.2 OCIAM thesis class]
%-------------------------- initial code -----------------------
\def\logoversion{squarelogo}
\DeclareOption{beltcrest}{\def\logoversion{beltcrest}}
\DeclareOption{shieldcrest}{\def\logoversion{shieldcrest}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper]{report}
% As an alternative to the above could use next line for twosided output
%\LoadClass[a4paper,twoside,openright]{report}

\RequirePackage{graphicx} % needed for latest frontpage logo
\RequirePackage{ifthen}   % needed for option parsing for logo

\raggedbottom

%define the default submitted text
\newcommand{\submittedtext}{{Applied Bachelor Program of Informatics Engineering}}

%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the thesis is submitted 
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your Oxford college (e.g. Christ Church, Pembroke)
\def\college#1{\gdef\@college{#1}}


%
% Setup choosen crest/logo
%

\ifthenelse{\equal{\logoversion}{shieldcrest}}%
{
% Traditional Oxford shield crest
%Using latex metafont (Mathematical Institute system)
\font\crestfont=oxcrest40 scaled\magstep3
\def\logo{{\crestfont \char1}}
%For comlab system replace 1st line above with
%\font\crestfont=crest scaled\magstep3
}{}

\ifthenelse{\equal{\logoversion}{beltcrest}}%
{
% Newer Oxford Belt crest
%Using latex metafont (Mathematical Institute system)
\font\beltcrestfont=oxbeltcrest
\def\logo{{\beltcrestfont \char0}}
%For comlab system replace 1st line above with
%\font\beltcrestfont=newcrest
}{}

\ifthenelse{\equal{\logoversion}{squarelogo}}%
{
% Latest Logo, Square version (the default!)
% you need an oxlogo.eps or oxlogo.pdf file as appropriate
\def\logo{{\includegraphics[width=32mm]{logo-poltekpos}}}
}{}

%
% Define text area of page and margin offsets
%
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\evensidemargin}{-0.08in}
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.0in}

%
% Environments
%

% This macro define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

%define title page layout
\renewcommand{\maketitle}{%
	\begin{alwayssingle}
		\renewcommand{\footnotesize}{\small}
		\renewcommand{\footnoterule}{\relax}
		\thispagestyle{empty}
		\null\vfill
		\begin{center}
			{ \Huge {\bfseries {\@title}} \par }
			{\large \vspace*{25mm} {\logo \par} \vspace*{10mm}}
			%\par \textbf{\textit{Dibuat Oleh,}} \par
			\vspace*{1ex}
			{{\Large \@author} \par}
			{\large \vspace*{1ex}
				{{\@college} \par}
				\vspace*{1ex}
				{ \par}
				\vspace*{20mm}
				{{\submittedtext} \par}
				\vspace*{1ex}
				{{\@degree} \par}
				\vspace*{1ex}
				{\textbf{BANDUNG} \par}
				\vspace*{1ex}
				{\@degreedate}}
		\end{center}
		\null\vfill
\end{alwayssingle}}

% Cover English
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{covereng}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\large \bfseries \textit{Judul Laporan Tingkat Akhir}}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{coverenglong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\large \bfseries \textit{Judul Laporan Tingkat Akhir}}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

% Pengesahan
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{pengesahan}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\large \bfseries Judul Laporan Tingkat Akhir}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{pengesahanlong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\large \bfseries Judul Laporan Tingkat Akhir}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

% Pernyataan
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{pernyataan}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries \underline{PERNYATAAN} \\
\Large{STATEMENT}}
\end{center}

\begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{pernyataanlong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries \underline{PERNYATAAN} \\
\Large{\textit{STATEMENT}}}
\end{center}
}
{\end{alwayssingle}}

% Halaman
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{halaman}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries \underline{HALAMAN PERNYATAAN} \\
\Large{\textit{STUDENTS STATEMENT}}}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{halamanlong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries \underline{HALAMAN PERNYATAAN} \\
\Large{\textit{STUDENTS STATEMENT}}}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

% Singkatan
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{singkatan}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\huge \bfseries DAFTAR SINGKATAN}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{singkatanlong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\huge \bfseries DAFTAR SINGKATAN}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

% Simbol
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{simbol}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\huge \bfseries DAFTAR SIMBOL}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{simbollong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\huge \bfseries DAFTAR SIMBOL}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{verse}\begin{center}}
{\end{center}\end{verse}\end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries KATA PENGANTAR}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries KATA PENGANTAR}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

% STATEMENT OF ORIGINALITY (AS SUGGESTED BY GSW)
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

\newenvironment{originality}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The originalitylong environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself does not appears in a quote environment so you can 
% get more in.

\newenvironment{originalitylong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

%ABSTRAK
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstrak} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  ABSTRAK}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstraklong} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  ABSTRAK}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}

%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries \textit{ABSTRACT}}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractlong} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries \textit{ABSTRACT}}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \thispagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@college} \par}
    {Politeknik Pos Indonesia \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

\def\@makechapterhead#1{%
    \vspace*{-27\p@}%FOR LESS VERTICAL SPACE YOU CAN MAKE IT UNTIL -127
    {\parindent \z@ \raggedright \normalfont
        \ifnum \c@secnumdepth >\m@ne
        \centering
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
        \fi
        \interlinepenalty\@M
        \centering
        \Huge \bfseries #1\par\nobreak
        \vskip 21\p@
    }}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

\renewcommand\thechapter{\Roman{chapter}}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}

\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}

\renewcommand{\chaptername}{BAB}
\renewcommand{\contentsname}{\center DAFTAR ISI}
\renewcommand{\listfigurename}{\center DAFTAR GAMBAR}
\renewcommand{\listtablename}{\center DAFTAR TABEL}
\renewcommand{\bibname}{\center DAFTAR PUSTAKA}
\renewcommand{\figurename}{Gambar}
\renewcommand{\tablename}{Tabel}
\renewcommand{\indexname}{INDEX}
\renewcommand{\partname}{Bagian}
\renewcommand{\appendixname}{LAMPIRAN}
\renewcommand{\submittedtext}{\textbf{PROGRAM DIPLOMA IV TEKNIK INFORMATIKA}}

