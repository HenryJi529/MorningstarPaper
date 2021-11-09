% Author: Henry Ji
% Email: jeep.jipu@gmail.com

% 表格: https://www.tablesgenerator.com/
% 公式: https://mathpix.com/
% 字数统计: https://docwordcounter.com/app/wordcountprocess
% 需要pygments依赖
\ProvidesClass{morningstar}[2021/05/06 v0.1 Morningstar class]
\NeedsTeXFormat{LaTeX2e} 

\RequirePackage{kvoptions}  % 提供键值可选项
\RequirePackage{etoolbox}  % 提供前端工具
\RequirePackage{calc}  % 提供一些参数的符号设置 

\SetupKeyvalOptions{family=MORNINGSTAR, prefix=MORNINGSTAR@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{MORNINGSTAR}{#1}}


\LoadClass[a4paper,twoside,fontset=none,sub3section]{ctexart}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexart}}

%% bib
\RequirePackage{gbt7714}
\citestyle{numbers}   %使用正文模式
\bibliographystyle{gbt7714-numerical}
\newcommand\addbib[1]{
  \bibliography{#1}
}


%% 数学
\RequirePackage{amsthm}  % 定理
\RequirePackage{amsmath}  % 公式
\numberwithin{equation}{section}  % 按照章节标号
\RequirePackage{mathtools}  % 对amsmath的封装
\RequirePackage{siunitx}  % 单位
\RequirePackage{amssymb}  % 符号
\RequirePackage{braket}  % 内积括号

%% 化学式
\RequirePackage{chemformula} 

%% 代码
\RequirePackage{minted}  % 调用Pygments

%% 算法
\RequirePackage{clrscode}  % 算法导论中使用的基础包
\RequirePackage{algorithm2e} 
\RequirePackage{algorithmicx}

%% 表格
\RequirePackage{multirow}  % 多行
\RequirePackage{multicol}  % 多列
\RequirePackage{makecell} % 单元格处理
\RequirePackage{longtable}
\RequirePackage{xtab} % 长表格
\RequirePackage{xltabular}  % 定宽表格
\RequirePackage{booktabs}  % 书籍表格
\RequirePackage{diagbox}
\RequirePackage{arydshln}  % 表线控制
\RequirePackage{array}  % 表列格式
\RequirePackage{tabu}  % 综合应用 

\renewcommand{\arraystretch}{1.5}  % 避免表格线与文字靠得太近

% 用于表格中的粗线
\newcommand{\thickhline}{%
    \noalign {\ifnum 0=`}\fi \hrule height 1pt
    \futurelet \reserved@a \@xhline
}

%% 图表标题修改
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{enskip}{\enskip}
\captionsetup{font=small,labelsep=enskip}
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}
\newcommand\captionWithStar[1]{% 更便利的引用
  \caption{#1}
  \label{#1}
}

%% 修改图、表的标号
\usepackage{chngcntr}
\counterwithin{table}{section}
\counterwithin{figure}{section}

%% 插图
\RequirePackage{graphicx} 
\graphicspath{{image/}{figure/}{fig/}{img/}}
\RequirePackage{tikz} % latex绘图

%% 浮动体
\RequirePackage{float} % 其它环境: float, table
\RequirePackage{caption}  % 浮动标题

%% 自动化工具
\RequirePackage{hyperref}  % 链接与书签
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=true,
  linkcolor={dark},
  urlcolor={winered},
  filecolor={winered},
  citecolor={winered},
  linktoc=all,
}
\RequirePackage{bookmark}  % 用于自定义相关属性

%% 版面布局
\RequirePackage[
  left=1in,
  right=1in,
  top=1.1in,
  bottom=1.5in,
  % headheight=9pt,
  headsep=20pt,
  ]{geometry}  

\RequirePackage{fancyhdr}  % 设置页眉页脚
\pagestyle{fancy}    % 设置页眉 
\setlength{\headheight}{1.5em} % 设置页眉高度
\fancyhf{}  % 清空
\fancyhead[EC]{\textcolor{fancycolor}{\zihao{-5}\leftmark}}
\fancyhead[OC]{\textcolor{fancycolor}{\zihao{-5}南京工业大学本科生毕业设计(论文)}}
\fancyfoot[C]{\textcolor{fancycolor}{\zihao{-5}\thepage}}

%% 列表环境定制
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nosep}  % 适配汉字不加过多间隙
\setlist{nolistsep}


%% 字体
\RequirePackage{anyfontsize}  % 灵活设置字体大小
\setmainfont{Times New Roman}
\setmonofont{Source Code Pro}
\setCJKmainfont[AutoFakeSlant,AutoFakeBold]{SimSun}
\setCJKmonofont[AutoFakeSlant,AutoFakeBold]{KaiTi}
\newcommand{\coverTitleFont}{\CJKfontspec[Path=font/]{STXINWEI.ttf}}

\RequirePackage{lipsum}  % lorem ipsum
\RequirePackage{setspace}\AfterEndPreamble{\doublespacing}
%\RequirePackage{setspace}\onehalfspacing  % 设置行间距
%\linespread{1.5} 



\RequirePackage{appendix}  % 附录
\RequirePackage{fancyvrb}  % 一系列环境配置
\RequirePackage{indentfirst}  % 段落首行缩进
\setlength{\parindent}{2em}
\RequirePackage{hologo}  % 设置类似latex那样的logo(特殊字) 
\RequirePackage{pdfpages}  % 插入PDF

% \RequirePackage{abstract} % 摘要
% \renewcommand\abstractname{摘\hspace{2em}要}
% \newcommand{\keywords}[1]{\vskip2ex\par\noindent\normalfont{\bfseries 关键词: } #1}


\RequirePackage{verbatim}  % comment环境



\setcounter{tocdepth}{3}  % 设置在 ToC 的显示的章节深度
\setcounter{secnumdepth}{3}  % 设置章节的编号深度

\newcommand\halflinespace{\vspace{0.5em}} % 半行
\RequirePackage{xcolor}  % 为code和hyperref提供颜色
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{dark}{rgb}{0,0,0}
\definecolor{lightgrey}{rgb}{0.95,0.95,0.95}
\definecolor{commentcolor}{RGB}{0,100,0}
\definecolor{frenchplum}{RGB}{190,20,83}
\definecolor{fancycolor}{rgb}{0.5,0.5,0.5}




%% 封面

% 封面信息定义
\let\@title\@empty
\let\@entitle\@empty
\let\@major\@empty
\let\@class\@empty
\let\@id\@empty
\let\@author\@empty
\let\@instructor\@empty
\let\@period\@empty
\DeclareRobustCommand*{\title}[1]{\gdef\@title{#1}}
\DeclareRobustCommand*{\entitle}[1]{\gdef\@entitle{#1}}
\DeclareRobustCommand*{\major}[1]{\gdef\@major{#1}}
\DeclareRobustCommand*{\class}[1]{\gdef\@class{#1}}
\DeclareRobustCommand*{\id}[1]{\gdef\@id{#1}}
\DeclareRobustCommand*{\author}[1]{\gdef\@author{#1}}
\DeclareRobustCommand*{\instructor}[1]{\gdef\@instructor{#1}}
\DeclareRobustCommand*{\period}[1]{\gdef\@period{#1}}
% 绘制封面

\newcommand\makecover{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \includegraphics[width=0.4\textwidth]{image/NJTech.png}
    \vskip 2em
    {\zihao{1}\coverTitleFont\underline{2021}届毕业设计（论文） \par}
    % {\zihao{1}\CJKfontspec[Path=font/]{STXINWEI.ttf}\underline{2021}届毕业设计（论文） \par} 
    \vskip 10em
    \begingroup
      \let\small\relax
      {\zihao{3}
      \def\arraystretch{1.25}
      \begin{tabular}{r@{：}c}
        \bf{题\hfill 目} & \@title       \\ \cline{2-2}
        \bf{专\hfill 业} & \@major       \\ \cline{2-2}
        \bf{班\hfill 级} & \@class       \\ \cline{2-2}
        \bf{姓\hfill 名} & \@author      \\ \cline{2-2}
        \bf{指导教师}     & \@instructor  \\ \cline{2-2}
        \bf{起讫日期}     & \@period      \\ \cline{2-2}
        % 学\hfill 号 & \makebox[160pt]{\@id} \\ \cline{2-2}
        
      \end{tabular}
      \par}
    \endgroup
    \vskip \stretch{1}
    %{\zihao{3} \@date \par}
    {\zihao{3} 2021年6月 \par}
    \vspace*{20pt}
  \end{center}
  \clearpage
}


\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}  % 邮箱





\theoremstyle{plain}% default
\newtheorem{theorem}{定理}[section] %
\newtheorem{lemma}[theorem]{引理} %
\newtheorem{proposition}[theorem]{命题} %
\newtheorem*{corollary}{推论} %
\theoremstyle{definition} %
\newtheorem{definition}{定义}[section] %
\newtheorem{conjecture}{猜想}[section] %
\newtheorem{example}{例}[section] %
\theoremstyle{remark} %
\newtheorem*{remark}{\normalfont\bfseries 评论} %
\newtheorem*{note}{\normalfont\bfseries 注} %
\newtheorem{case}{\normalfont\bfseries 案例} %
\renewcommand*{\proofname}{\normalfont\bfseries 证明} %
\renewcommand\contentsname{目录}
\renewcommand\refname{参考文献} %
\renewcommand\figurename{图} %
\renewcommand\tablename{表}%
\newcommand\versiontext{版本：}%
\newcommand\updatetext{日期：}%







\newcommand\figref[1]{{\bfseries 图~\ref{#1}}}
\newcommand\tabref[1]{{\bfseries 表~\ref{#1}}}

\RequirePackage{gbt7714}  % 中文文献索引

\renewcommand{\appendixtocname}{附录}
\renewcommand{\appendixpagename}{附录}




%% 显示文章标题
\newcommand\showcntitle{
  \vspace*{1cm}
  \centerline{\textbf{\zihao{-2}\@title}}
  }

\newcommand\showentitle{
  \vspace*{1cm}
  \begin{center}
  \textbf{\zihao{-2}\@entitle}
  \end{center}
  }


%% 显示摘要中的关键词  
\newcommand{\showcnkeywords}[1]{
  \noindent \textbf{关键词: } #1
}  

\newcommand{\showenkeywords}[1]{
  \noindent \textbf{Key Words: } #1
}  


\ctexset{
  section={
    format += \zihao{3},
    name   = {第,章},
    number = \chinese{section},
    beforeskip = 1.0ex plus 0.2ex minus .2ex,
		afterskip = 1.0ex plus 0.2ex minus .2ex,
  },
  subsection={
    format += \zihao{4} \raggedright ,
  },
  subsubsection={
    format += \large \raggedright ,
  },
  paragraph={
    format += $\blacksquare~$ \zihao{-4},
    beforeskip = 0ex plus 0.1ex minus .1ex,
    afterskip = 0ex plus 0.1ex minus .1ex,
  },
  subparagraph={
    format += $\Diamond~$ \zihao{-4},
  },
}


%% 设置目录格式
\RequirePackage[titles]{tocloft}
\renewcommand\cftdot{.}
\renewcommand\cftsecleader{\normalfont\cftdotfill{\cftdotsep}}





%% 附录
\RequirePackage{tocvsec2}  % 可以随处定义加入目录的级别
\newcommand\startappendix{  % 开始附录
  \clearpage
  \appendix
  \addappheadtotoc
  \appendixpage
  \settocdepth{part}  % 排除part以下内容出目录
}


%% 正文全局字体
\newcommand\setfontformat{\zihao{-4}}

%% 中文的强调
\renewcommand\emph[1]{
  \textbf{#1}
}

%% 页码标记
\newcommand\startfrontpart{
  \pagenumbering{Roman}  % 罗马数字页码
}
\newcommand\startmainpart{
  \pagenumbering{arabic}  % 阿拉伯数字页码
}

%% 待补充标号
\newcommand\TOFILL{
  \textbf{这里还要补充啊喂!}
}


%% section 章节不标号，添加到目录
\newcommand\sectionWithStar[1]{
\section*{#1}
\addcontentsline{toc}{section}{#1}
\markboth{#1}{#1}
}

%% subsubsection章节标号，不添加到目录
\newcommand\hiddensubsubsection[1]{
  \stepcounter{subsubsection}
  \noindent \textbf{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}\hspace{1em}#1}
}

%% 失败尝试
% %% subsubsubsection
% \newcounter{subsubsubsecCounter}
% \setcounter{subsubsubsecCounter}{1}
% \newcommand\subsubsubsection[1]{
%   \noindent\textbf{  {\zihao{-4} \thesubsubsubsecCounter)~~#1 }  }\\
%   \indent
%   \addtocounter{subsubsubsecCounter}{1}
% }
% \newcommand\subsubSection[1]{
%   \setcounter{subsubsubsecCounter}{1}
%   \subsubsection{#1}
% }

