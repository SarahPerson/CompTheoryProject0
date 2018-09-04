\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ntdhw}[2017/08/20 Homework LaTeX class]
\renewcommand\normalsize{\fontsize{10pt}{12pt}\selectfont}

\usepackage{fancyhdr}
\usepackage{lastpage}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage[margin=1in]{geometry}
\usepackage{tikz}

\pagestyle{fancyplain}

\usepackage[linkbordercolor={1 1 1},citebordercolor={1 1
  1},urlbordercolor={0.0 0.0
  0.0},urlcolor=blue,colorlinks=true,linkcolor=black,citecolor=black]{hyperref}

\newcommand{\descnl}[0]{$ $ \\ \vspace{-1.5em}}
\rhead{Name:\hspace{1.5in}}
\cfoot{{\thepage} {of} {\pageref{LastPage}}}
\renewcommand{\headrulewidth}{0pt}

\usepackage{ntdmath}

\usepackage{xcolor}
\newif\ifkey
\newcommand\hwansv[2]{ %
  \ifkey
  {\color{green!50!black}{#2}} %
  \else
  \vspace{#1}
  \fi
}

\newcommand\hwans[1]{ %
  \hwansv{0em}{#1}}



\tikzset{%
  fastate/.style = {%
    circle,draw,align=center,node distance=6em,thick
  },
  fastateo/.style = {%
    ellipse,draw,align=center,node distance=6em,thick,
    align=center
  },
  faaccept/.style = {%
    fastate,double
  },
  faedge/.style = {%
    ->,thick,>=stealth
  },
  faedgeup/.style = {%
    out=30,in=150
  },
  faedgedn/.style = {%
    out=210,in=330
  },
  faouter/.style={%
    draw,rounded corners=1em,node distance=4em
  }
}

\newcommand{\fastart}[2][]{%
  \draw[faedge]
  node[node distance=2em,font=\scriptsize,#1] {start}
  edge (#2);
}


%%%%%%%%%%%%%%%%%%%%%
%%% Cons Diagrams %%%
%%%%%%%%%%%%%%%%%%%%%

\tikzset{%
  cons/.style = {%
    rectangle split, rectangle split parts=2,
    draw, rectangle split horizontal, on chain, align=center,
    append after command={%
      \pgfextra{%
        \let\mainnode=\tikzlastnode}
      coordinate (car \mainnode) at ($(\mainnode.west)!.5!(\mainnode.one split)$)
      coordinate (cdr \mainnode) at ($(\mainnode.one split)!.5!(\mainnode.east)$)}
    },
    sexpptr/.style = {%
      >=latex,->,thick
    },
    sexpval/.style  = {%
      font=\tt
    },
    sexpnil/.style = {%
      sexpval,on chain
    }
}


\newcommand{\cdrptr}[2]{%
    \draw[sexpptr] (cdr #1) -- (#2);
    \draw[fill] (cdr #1) circle (.2em);
}

\newcommand{\carptr}[2]{%
    \draw[sexpptr] (car #1) -- (#2);
    \draw[fill] (car #1) circle (.2em);
}

\newcommand{\carbezptr}[4]{%
  \draw[sexpptr] (car #1)
  .. controls (#3) and (#4) ..
  (#2);
  \draw[fill] (car #1) circle (.2em);
}
