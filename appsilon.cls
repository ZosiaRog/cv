\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{404040}
\definecolor{lightgray}{HTML}{999999}
\definecolor{footergray}{HTML}{8E8E8E}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{deepblue}{HTML}{09669F}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
  \colorlet{fillfooter}{footergray}
\else
  \colorlet{fillheader}{deepblue}
  \colorlet{fillfooter}{footergray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Linkedin ref (by Appsilon)
%%%%%%%%

\newcommand{\linkedinRef}[1]{%
	\begin{tikzpicture}
	    \begin{scope}
	    \node {\includegraphics[scale=0.3]{img/linkedin.png}};
	    \end{scope}
	    \begin{scope}[xshift=2.5cm, yshift=-0.15cm]
	    \node[text width=4cm] {\href{#1}{ \small{#1} }};
	    \end{scope}
	\end{tikzpicture}
	\vspace*{-0.3cm}
}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[]{Lato Regular}
\newfontfamily\thinfont[]{Lato Light}
\newfontfamily\headingfont[]{Lato Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Lato Regular}

%\setmathfont{XITS Math}

%%%%%%%%%%%%%%
% Title page %
%%%%%%%%%%%%%%

\newcommand{\titlePage}[2]{%
  \begin{tikzpicture}[remember picture,overlay]

    %\node [minimum width=25cm] (logo) at (11.5,-2) {\includegraphics[width=25cm]{img/logoBig.png}};

    \node [text width=8.8cm] at (12.9,-15) { 
	\fontsize{48pt}{72pt}\color{black} \thinfont #1
    };
    \node [text width=8.8cm, minimum height=0.5cm] at (13,-16.75) { 
	\fontsize{24pt}{36pt}\color{black} \thinfont #2 
    };
    \node [text width=8.8cm, minimum height=0.5cm] at (13,-18) { 
	\fontsize{24pt}{36pt}\color{black} \thinfont \today 
    };
    %\node[yshift=3cm, rectangle] (mono) at (current page.south) { \includegraphics[width=8cm]{img/logoMono.png} };
    \node[yshift=0.5cm, xshift=0cm, rectangle, minimum width=\paperwidth, minimum height=1cm, fill=fillfooter] (footer) at (current page.south) {};


  \end{tikzpicture}
}

%%%%%%%%%%
% Footer %
%%%%%%%%%%

\RequirePackage{atbegshi}

\newcommand{\footer}[2]{%
  \begin{tikzpicture}[remember picture,overlay]

    %\node[yshift=2cm, rectangle] (mono) at (current page.south) { \includegraphics[width=4cm]{img/logoMono.png} };
    \node[yshift=0.5cm, xshift=0cm, rectangle, minimum width=\paperwidth, minimum height=1cm, fill=fillfooter] (footer) at (current page.south) {\color{white} \thinfont \arabic{page}};

  \end{tikzpicture}
}


%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=north east] (logo) at (15.61,4.65) {\includegraphics[width=\paperwidth]{img/bg4.png}};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand\thesection{\arabic{section}} % TODO: check that.

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.5cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entryThree}[7]{%
  #1&\parbox[t][0.2cm]{11.5cm}{%
    \textbf{#4}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #5}\\%
    \vspace{\parsep}%
  }\\
  #2&\parbox[t][0.2cm]{11.5cm}{%
    #6\vspace{\parsep}%
  }\\
  #3&\parbox[t]{11.5cm}{%
    #7\vspace{\parsep}%
  }\\}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entryTwo}[5]{%
  #1&\parbox[t][0.2cm]{11.5cm}{%
    \textbf{#3}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #4}\\%
    \vspace{\parsep}%
  }\\
  #2&\parbox[t][0.2cm]{11.5cm}{%
    #5\vspace{\parsep}%
  }\\}

\newcommand{\entryR}[4]{%
  \parbox[t]{10cm}{%
    \textbf{#1}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    {#2}\\%
    #4\vspace{\parsep}%
  }\\}

\newcommand{\entryRL}[4]{%
  \parbox[t]{15cm}{%
    \textbf{#1}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    {#2}\\%
    #4\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newenvironment{sidebar}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{4}(1.1, 4.23)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

\newenvironment{noSidebar}{%
  \begin{textblock}{15}(3, 4.33) %
}{%
  \end{textblock} %
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\newcommand{\initAppsilonDocument}{ %
  \RequirePackage[left=2.5cm,top=2cm,right=2.5cm,bottom=2.5cm,nohead,nofoot]{geometry} %
  %
  % Add footer to every page.
  \pagestyle{empty} %
  \AtBeginShipoutFirst{} %
  \AtBeginShipout{\footer} %
}

\newcommand{\initAppsilonSidebarDocument}{ %
 \RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry} %
}

\RequirePackage{hyperref}
