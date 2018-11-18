% UTFSM Memoir template for Informatics Department
%
% Copyright (C) 2018  Manuel Weitzman
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.

\NeedsTeXFormat{LaTeX2e}

\LoadClassWithOptions{extreport}
\ProvidesClass{dimemoir}[2018-11-18 v0.01 LaTeX package for UTFSM DI Memoir]

\RequirePackage{graphicx}
\pdfminorversion=8
% ==============================================
% MARGINS
% ==============================================

\hoffset=0mm
\voffset=0mm
\oddsidemargin=14.6mm
\evensidemargin=4.6mm
\topmargin=-17.6mm
\headheight=17.6mm
\headsep=4.6mm
\textheight=219.4mm
\textwidth=145.9mm
\marginparsep=4.6mm
\marginparwidth=17.6mm
\footskip=10.58mm
\marginparpush=4.23mm
\paperwidth=215.9mm
\paperheight=279.4mm


% ==============================================
% TYPOGRAPHY
% ==============================================

% Line spacing
\newcommand*{\doublespacing}{\linespread{1.667}}
\newcommand*{\onehalfspacing}{\linespread{1.25}}
\newcommand*{\singlespacing}{\linespread{1}}
\onehalfspacing

% Paragraph indentation & separation
\parindent=0ex
\parskip=2ex


% ==============================================
% MACRO DEFINITION
% ==============================================

% Template variables
\def\university#1{\gdef\@university{#1}}
\def\department#1{\gdef\@department{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\guideprof#1{\gdef\@guideprof{#1}}
\def\corrprof#1{\gdef\@corrprof{#1}}
\def\guideprofcue#1{\gdef\@guideprof{#1}}
\def\corrprofcue#1{\gdef\@corrprof{#1}}
\def\submitmonth#1{\gdef\@submitmonth{#1}}
\def\submityear#1{\gdef\@submityear{#1}}
\def\isotypebw#1{\gdef\@isotypebw{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\usenotice#1{\gdef\@usenotice{#1}}
\def\degreecue#1{\gdef\@degreecue{#1}}
\def\isotypecolor#1{\gdef\@isotypecolor{#1}}

% Default values
\def\@title{Title}
\def\@author{Author}
\def\@date{\today}
\def\@university{Universidad T\'ecnica Federico Santa Mar\'ia}
\def\@department{Departmento de Inform\'atica}
\def\@faculty{Santiago -- Chile}
\def\@guideprof{Profesor gu\'ia}
\def\@corrprof{Profesor correferente}
\def\@guideprofcue{Profesor gu\'ia:}
\def\@corrprofcue{Profesor correferente:}
\def\@submitmonth{%
  \ifcase\the\month%
  \or enero%
  \or febrero%
  \or marzo%
  \or abril%
  \or mayo%
  \or junio%
  \or agosto%
  \or septiembre%
  \or octubre%
  \or noviembre%
  \or diciembre%
  \fi%
}
\def\@submityear{\the\year}
\def\@degreecue{Memoria de titulaci\'on para optar al t\'itulo de}
\def\@degree{Ingeniero civil inform\'atico}
\def\@usenotice{MATERIAL DE REFERENCIA, SU USO NO INVOLUCRA RESPONSABILIDAD DEL AUTOR O LA INSTITUCI\'ON}



% ==============================================
% COMMAND DEFINITION
% ==============================================

% Front matter
\newcommand*{\frontmatter}{%
  \cleardoublepage%
  \pagenumbering{roman}%
}

% Main matter
\newcommand*{\mainmatter}{%
  \cleardoublepage%
  \pagenumbering{arabic}%
  \renewcommand\theequation{\thechapter.\arabic{equation}}%
}

% Back matter
\newcommand*{\backmatter}{%
  \singlespacing%
  \cleardoublepage%
}

% Dedication
\newenvironment{dedication}%
  {\cleardoublepage\flushright%
  \large\em\null\vfill}%
  {\vspace{30mm}%
  \endflushright\cleardoublepage}

% Cover page
\newcommand*{\makecoverpage}[1][0.98]{%
  \newdimen\coverpagept%
  \coverpagept=1pt%
  \coverpagept=#1\coverpagept%
  \thispagestyle{empty}%
  \begin{center}%
    {\fontsize{18\coverpagept}{1em}\selectfont\uppercase\expandafter{\@university}}\\ \vspace{5mm}%
    {\fontsize{16\coverpagept}{1em}\selectfont\uppercase\expandafter{\@department}}\\%
    {\fontsize{14\coverpagept}{1em}\selectfont\uppercase\expandafter{\@faculty}}\\ \vspace{20mm}%
    \ifcsname @isotypebw\endcsname%
      {\includegraphics[height=33mm]{\@isotypebw}}\vfill%
    \else
      {\fbox{\parbox[c][33mm]{44mm}{\texttt{\textbackslash isotypebw} is undefined}}}\vfill%
    \fi
    {\fontsize{20\coverpagept}{1em}\selectfont\uppercase\expandafter{\@title}}\vfill\vfill%
    {\fontsize{14\coverpagept}{1em}\selectfont\uppercase\expandafter{\@author}}\\ \vspace{4mm}%
    {\fontsize{12\coverpagept}{1em}\selectfont\uppercase\expandafter{\@degreecue}\\\uppercase\expandafter{\@degree}}\\ \vspace{4mm}%
    {\fontsize{12\coverpagept}{1em}\selectfont\uppercase\expandafter{\@guideprofcue} \uppercase\expandafter{\@guideprof}}\\ \vspace{10mm}%
    {\fontsize{14\coverpagept}{1em}\selectfont\uppercase\expandafter{\@submitmonth} \@submityear}%
  \end{center}%
  \clearpage{\pagestyle{empty}\cleardoublepage}%
}

% Title page
\newcommand*{\maketitlepage}[1][0.93]{%
  \newdimen\titlepagept%
  \titlepagept=1pt%
  \titlepagept=#1\titlepagept%
  \thispagestyle{empty}%
  \begin{center}%
    {\fontsize{18\titlepagept}{1em}\selectfont\bf\uppercase\expandafter{\@university}}\\ \vspace{5mm}%
    {\fontsize{16\titlepagept}{1em}\selectfont\bf\uppercase\expandafter{\@department}}\\%
    {\fontsize{14\titlepagept}{1em}\selectfont\bf\uppercase\expandafter{\@faculty}}\\ \vspace{20mm}%
    \ifcsname @isotypecolor\endcsname%
      {\includegraphics[height=33mm]{\@isotypecolor}}\vfill%
    \else
      {\fbox{\parbox[c][33mm]{44mm}{\texttt{\textbackslash isotypecolor} is undefined}}}\vfill%
    \fi
    {\fontsize{20\titlepagept}{1em}\selectfont\bf\uppercase\expandafter{\@title}}\vfill\vfill%
    {\fontsize{14\titlepagept}{1em}\selectfont\bf\uppercase\expandafter{\@author}}\\ \vspace{4mm}%
    {\fontsize{12\coverpagept}{1em}\selectfont\bf\uppercase\expandafter{\@degreecue}\\\uppercase\expandafter{\@degree}}\\ \vspace{4mm}%
    {\fontsize{12\titlepagept}{1em}\selectfont\bf\uppercase\expandafter{\@guideprofcue} \uppercase\expandafter{\@guideprof}}\\%
    {\fontsize{12\titlepagept}{1em}\selectfont\bf\uppercase\expandafter{\@corrprofcue} \uppercase\expandafter{\@corrprof}}\\ \vspace{10mm}%
    {\fontsize{14\titlepagept}{1em}\selectfont\bf\uppercase\expandafter{\@submitmonth} \@submityear}\\ \vspace{4mm}%
    {\fontsize{8\titlepagept}{1em}\selectfont\bf\uppercase\expandafter{\@usenotice}}%
  \end{center}%
  \clearpage{\pagestyle{empty}\cleardoublepage}%
}

% Table of contents and figure lists
\let\oldtableofcontents\tableofcontents
\let\oldlistoftables\listoftables
\let\oldlistoffigures\listoffigures

\renewcommand*\tableofcontents{%
  \cleardoublepage\phantomsection\addcontentsline{toc}{chapter}{\contentsname}%
  \oldtableofcontents%
}
\renewcommand*\listoftables{%
  \cleardoublepage\phantomsection\addcontentsline{toc}{chapter}{\listtablename}%
  \oldlistoftables%
}
\renewcommand*\listoffigures{%
  \cleardoublepage\phantomsection\addcontentsline{toc}{chapter}{\listfigurename}%
  \oldlistoffigures%
}

% Bibliography
\let\oldbibliography\bibliography

\renewcommand*\bibliography[1]{%
  \cleardoublepage\phantomsection\addcontentsline{toc}{chapter}{\bibname}%
  \oldbibliography{#1}%
}


% ==============================================
% DRAFT MODE OPTIONS
% ==============================================
\makeatletter
  \ifdim\overfullrule>\z@
    \RequirePackage{showframe}
    \renewcommand*\ShowFrameColor{\color{lightgray}}
  \fi
\makeatother


% ==============================================
% HARDCODED TRANSLATIONS
% ==============================================
\newcommand*{\makehardcodedtranslations}{%
  \renewcommand*{\contentsname}{\'Indice de Contenidos}%
  \renewcommand*{\listfigurename}{Lista de Figuras}%
  \renewcommand*{\listtablename}{Lista de Tablas}%
  \renewcommand*{\bibname}{Referencias}%
}

% ==============================================
% WORK BETTER WITH HYPERREF PACKAGE
% ==============================================
\providecommand*\phantomsection{}

