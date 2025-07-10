% file: mynote.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mynote}[2025/07/10 Custom Note Template]

% 基类选项传递
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,10pt]{article}

% 加载所需包
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[strict]{changepage}
\RequirePackage{fancyhdr}
\RequirePackage{framed}
\RequirePackage{geometry}
\RequirePackage[colorlinks,linkcolor=black]{hyperref}
\RequirePackage{mathabx}
\RequirePackage{newtxtext}
\RequirePackage{subfiles}
\RequirePackage{theorem}
\RequirePackage[dvipsnames,svgnames]{xcolor}

% 页面布局设置
\geometry{a4paper,centering,scale=0.8}

% 颜色定义
\definecolor{purpleshade}{rgb}{0.95,0.95,1}
\definecolor{greenshade}{HTML}{e4f9f5}
\definecolor{yellowshade}{HTML}{FFFFCE}
\definecolor{DarkBlue}{HTML}{00008B} 
\definecolor{DarkGreen}{HTML}{006400}
\definecolor{DarkYellow}{HTML}{FFA200}

% 笔记环境命令
\newcommand{\setupnote}{%
    % 定义用紫色
    \newenvironment{purple}{%
        \def\FrameCommand{%
            \hspace{1pt}%
            {\color{DarkBlue}\vrule width 2pt}%
            {\color{purpleshade}\vrule width 4pt}%
            \colorbox{purpleshade}%
        }%
        \MakeFramed{\advance\hsize-\width\FrameRestore}%
        \noindent\hspace{-4.55pt}%
        \begin{adjustwidth}{}{7pt}%
        \vspace{2pt}\vspace{2pt}%
    }{%
        \vspace{2pt}\end{adjustwidth}\endMakeFramed%
    }

    % 注释用绿色
    \newenvironment{green}{%
        \def\FrameCommand{%
            \hspace{1pt}%
            {\color{DarkGreen}\vrule width 2pt}%
            {\color{greenshade}\vrule width 4pt}%
            \colorbox{greenshade}%
        }%
        \MakeFramed{\advance\hsize-\width\FrameRestore}%
        \noindent\hspace{-4.55pt}%
        \begin{adjustwidth}{}{7pt}%
        \vspace{2pt}\vspace{2pt}%
    }{%
        \vspace{2pt}\end{adjustwidth}\endMakeFramed%
    }

    % 定理用黄色
    \newenvironment{yellow}{%
        \def\FrameCommand{%
            \hspace{1pt}%
            {\color{DarkYellow}\vrule width 2pt}%
            {\color{yellowshade}\vrule width 4pt}%
            \colorbox{yellowshade}%
        }%
        \MakeFramed{\advance\hsize-\width\FrameRestore}%
        \noindent\hspace{-4.55pt}%
        \begin{adjustwidth}{}{7pt}%
        \vspace{2pt}\vspace{2pt}%
    }{%
        \vspace{2pt}\end{adjustwidth}\endMakeFramed%
    }
    
    % 定理环境
    \newtheorem{definition}{Definition}[subsection]
    \newtheorem{proof}{Proof}[subsection]
    \newtheorem{theorem}{Theorem}[subsection]
}

% 标题页命令
\newcommand{\makemytitle}[3]{%
    \begin{titlepage}
        \centering
        \fontfamily{ptm}\selectfont % Times New Roman
        {\Large\bfseries #1\par}
        \vspace{1cm}
        \rule{\textwidth}{0.4pt}\par % 标题装饰线
        \vspace{1.5cm}
        {\Huge\bfseries #2\par}
        \vfill
        {\large\bfseries #3\par}
        \vspace{1cm}
        {\large School of Computer Science\par}
        {\large\bfseries WuHan University\par}
        \vspace{0.5cm}
        {\large \@date\par}
    \end{titlepage}
}

% 页眉页脚设置
\newcommand{\setupheaderfooter}{%
    \pagestyle{fancy}
    \fancyhf{} % 清除所有页眉页脚
    \renewcommand{\headrulewidth}{0pt} % 去掉页眉下划线
}