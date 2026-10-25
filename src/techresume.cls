% techresume.cls -- base resume template
% Layout only: fonts, margins, headings, and entry macros.
% Content lives in the .tex file that loads this class.
%
% Usage:
%   \documentclass{techresume}
%   \name{Your Name}
%   \contact{\link{https://example.com}{example.com} \sep ...}
%   \begin{document}
%   \makeheader
%   \section{Work Experience}
%   \begin{job}{Company}{Location}{Title}{Dates}
%     \item ...
%   \end{job}
%   ...
%   \end{document}
%
% From the repo root: make   (every .tex file in this folder)
%
% Class option: a4paper (A4 instead of US Letter).
% Font is TeX Gyre Termes, a Times clone that ships with TeX. pdfLaTeX.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techresume}[2026/10/24 Base resume template]

% ---------- Options ----------
\newif\if@afour \@afourfalse
\DeclareOption{a4paper}{\@afourtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[11pt]{article}

% ---------- Page geometry ----------
\if@afour
  \RequirePackage[a4paper,left=0.61in,right=0.61in,top=0.53in,bottom=0.56in]{geometry}
\else
  \RequirePackage[letterpaper,left=0.61in,right=0.61in,top=0.53in,bottom=0.56in]{geometry}
\fi

% ---------- Fonts ----------
\RequirePackage[T1]{fontenc}
\RequirePackage{tgtermes}

% ---------- Packages ----------
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage[hidelinks]{hyperref}

% ---------- Tunable settings (redefine in your .tex to adjust) ----------
\definecolor{subtle}{HTML}{404040}       % grey used for secondary text
\newcommand{\bodysize}{\fontsize{10.5}{12.2}\selectfont}
\newcommand{\namesize}{\fontsize{18}{21}\selectfont}
\newcommand{\headingsize}{\fontsize{11}{13}\selectfont}
\newlength{\entryskip}  \setlength{\entryskip}{6pt}   % space between entries

% ---------- Base paragraph settings ----------
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\AtBeginDocument{\bodysize\raggedright}

% ---------- Section headings: bold caps with a rule underneath ----------
\titleformat{\section}
  {\headingsize\bfseries}
  {}{0pt}{\MakeUppercase}
  [\vspace{-5pt}\rule{\linewidth}{0.5pt}]
\titlespacing*{\section}{0pt}{8pt}{4pt}

% ---------- Bullet lists ----------
\setlist[itemize]{label=\textbullet, leftmargin=0.18in, labelsep=0.08in,
  itemsep=0pt, parsep=0pt, topsep=0pt, partopsep=0pt}

% ---------- Small helpers ----------
\newcommand{\sep}{ | }                      % vertical-bar separator, in the text font
\newcommand{\link}[2]{\href{#1}{#2}}       % \link{url}{display text}
\newcommand{\entrygap}{\par\addvspace{\entryskip}}

% ---------- Header ----------
\def\@resumename{}
\def\@resumecontact{}
\newcommand{\name}[1]{\def\@resumename{#1}}
\newcommand{\contact}[1]{\def\@resumecontact{#1}}
\newcommand{\makeheader}{%
  \begin{center}
    {\namesize\bfseries\@resumename}\\[2pt]
    \@resumecontact
  \end{center}
  \vspace{-8pt}%
}

% ---------- Entries ----------
% Job with bullets:
%   \begin{job}{Company}{Location}{Title}{Dates} \item ... \end{job}
\newenvironment{job}[4]{%
  \textbf{#1}\hfill #2\\
  #3\hfill #4\par\vspace{1pt}%
  \begin{itemize}%
}{%
  \end{itemize}\entrygap
}

% Project (or any titled entry) with bullets:
%   \begin{project}{Title} \item ... \end{project}
\newenvironment{project}[1]{%
  \textbf{#1}\par
  \begin{itemize}%
}{%
  \end{itemize}\entrygap
}

% Education entry (no bullets):
%   \school{School}{College}{GPA}{Degree}{Dates}
\newcommand{\school}[5]{%
  \textbf{#1} | {\color{subtle}#2}\hfill \textbf{#3}\\
  \textbf{#4}\hfill #5\entrygap
}

% Paragraph block (e.g., a narrative section):
%   \para{Text...}
\newcommand{\para}[1]{#1\entrygap}

% Inline list separated by bars:
%   \skills{Rust, Python, C++}
\RequirePackage{etoolbox}
\newcommand{\skills}[1]{%
  \def\@skillsep{\def\@skillsep{\sep}}%
  \renewcommand*{\do}[1]{\@skillsep##1}%
  \docsvlist{#1}\par
}

\endinput
