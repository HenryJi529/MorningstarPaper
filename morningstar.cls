% Author: Henry Ji
% Email: jeep.jipu@gmail.com


\ProvidesClass{morningstar}[2023/07/25 Morningstar class]
\NeedsTeXFormat{LaTeX2e}


%% 处理包继承关系
\RequirePackage{kvoptions}  % 提供键值可选项
\RequirePackage{etoolbox}  % 提供前端工具
\RequirePackage{calc}  % 提供一些参数的符号设置

\SetupKeyvalOptions{family=MORNINGSTAR, prefix=MORNINGSTAR@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{MORNINGSTAR}{#1}}

\LoadClass[a4paper,twoside,fontset=none,sub3section]{ctexart}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexart}}


%% 信息
\let\@title\@empty
\let\@entitle\@empty
\let\@major\@empty
\let\@class\@empty
\let\@phone\@empty
\let\@email\@empty
\let\@zipcode\@empty
\let\@id\@empty
\let\@author\@empty
\let\@enauthor\@empty
\let\@organization\@empty
\let\@enorganization\@empty
\let\@location\@empty
\let\enlocation\@empty
\let\@instructor\@empty
\let\@period\@empty
\let\@date\@empty
\let\@grade\@empty
\let\@purpose\@empty
\DeclareRobustCommand{\title}[1]{\gdef\@title{#1}}
\DeclareRobustCommand{\entitle}[1]{\gdef\@entitle{#1}}
\DeclareRobustCommand{\major}[1]{\gdef\@major{#1}}
\DeclareRobustCommand{\class}[1]{\gdef\@class{#1}}
\DeclareRobustCommand{\phone}[1]{\gdef\@phone{#1}}
\DeclareRobustCommand{\email}[1]{\gdef\@email{#1}}
\DeclareRobustCommand{\zipcode}[1]{\gdef\@zipcode{#1}}
\DeclareRobustCommand{\id}[1]{\gdef\@id{#1}}
\DeclareRobustCommand{\author}[1]{\gdef\@author{#1}}
\DeclareRobustCommand{\enauthor}[1]{\gdef\@enauthor{#1}}
\DeclareRobustCommand{\organization}[1]{\gdef\@organization{#1}}
\DeclareRobustCommand{\enorganization}[1]{\gdef\@enorganization{#1}}
\DeclareRobustCommand{\location}[1]{\gdef\@location{#1}}
\DeclareRobustCommand{\enlocation}[1]{\gdef\@enlocation{#1}}
\DeclareRobustCommand{\instructor}[1]{\gdef\@instructor{#1}}
\DeclareRobustCommand{\period}[1]{\gdef\@period{#1}}
\DeclareRobustCommand{\date}[1]{\gdef\@date{#1}}
\DeclareRobustCommand*{\grade}[1]{\gdef\@grade{#1}}
\DeclareRobustCommand{\purpose}[1]{\gdef\@purpose{#1}}


%% ctex配置
\ctexset{
  section={
    % format = \bfseries\raggedright\zihao{2},
    format = \zihao{5} \hei \raggedright \textnormal,
    % format += \raggedright,
    % name = {第,章},
    % name = {,、},
    % aftername = ,
    aftername = ~,
    % number = \chinese{section},
    beforeskip = 2ex plus 0.5ex minus 0.5ex,
		afterskip = 2ex plus 0.5ex minus 0.5ex,
  },
  subsection={
    % format += \zihao{-2} \raggedright ,
    format += \zihao{-5} \raggedright \hei \textnormal,
  },
  subsubsection={
    % format += \zihao{3} \raggedright ,
    format += \zihao{-5} \raggedright \kai \textnormal,
  },
  paragraph={
    format += $\blacksquare~$ \zihao{4},
  },
  subparagraph={
    format += $\Diamond~$ \zihao{4},
  },
}


%% 版面布局
\RequirePackage{multicol} % 双排
\RequirePackage[
  left=1in,
  right=1in,
  top=1.1in,
  bottom=1.2in,
  % headheight=9pt,
  headheight=35pt,
  headsep=20pt,
]{geometry}


%% 页眉页脚
\RequirePackage{fancyhdr}  % 设置页眉页脚
\pagestyle{fancy}  % 设置页眉 
% \setlength{\headheight}{1.5em}  % 设置页眉高度
\fancyhf{}  % 清空
% \fancyhead[EC]{\textcolor{fancycolor}{\zihao{-5}\leftmark}}
% \fancyhead[OC]{\textcolor{fancycolor}{\zihao{-5} \@purpose }}
% \fancyfoot[C]{\textcolor{fancycolor}{\zihao{-5}\thepage}}
\fancyhead[R]{\textcolor{fancycolor}{\zihao{-5}\thepage}}
\fancyhead[EL]{Computer Science  计算机科学 Vol.x, No.y, Month.2023}
\fancyhead[OL]{\@author : \@title}
\fancypagestyle{firstpage}{
  \fancyhead[L]{\includegraphics[width=4cm]{./asset/img/计算机学报.png}}
  \renewcommand{\headrulewidth}{0.4pt}  % 可选，如果想画一条页眉下方的横线
}


%% 页码
\newcommand\startfrontpart{
  \pagenumbering{Roman}  % 罗马数字页码
}
\newcommand\startmainpart{
  \pagenumbering{arabic}  % 阿拉伯数字页码
}


%% 间距
% 行距
\RequirePackage{setspace}
% 段落
\RequirePackage{indentfirst}  % 段落首行缩进
\setlength{\parindent}{2em}
% \setlength{\parskip}{0.5em}
% 定义新的环境：parskiping
\newenvironment{parskiping}[1]
  {\begingroup\setlength{\parskip}{#1}\ignorespaces}
  {\endgroup}
% 特定
\newcommand\halflinespace{\vspace{0.5em}}  % 半行


%% 字体
\RequirePackage{anyfontsize}  % 灵活设置字体大小
\setmainfont{Times New Roman}
\setmonofont{Source Code Pro}
\setCJKmainfont[AutoFakeSlant,AutoFakeBold]{SimSong}
\setCJKmonofont[AutoFakeSlant,AutoFakeBold]{FZKai-Z03}
\newcommand{\coverTitleFont}{\CJKfontspec[Path=asset/font/]{STXINWEI.ttf}}
\newcommand{\song}{\CJKfontspec{SimSong}}
\newcommand{\fangsong}{\CJKfontspec[AutoFakeBold]{FZFangSong-Z02}}
\newcommand{\kai}{\CJKfontspec[AutoFakeBold]{FZKai-Z03}}
\newcommand{\hei}{\CJKfontspec[AutoFakeBold]{SimHei}}
\newfontfamily{\timesnewroman}{Times New Roman}


%% 颜色
\RequirePackage{xcolor}  % 为code和hyperref提供颜色
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{dark}{rgb}{0,0,0}
\definecolor{lightgrey}{rgb}{0.95,0.95,0.95}
\definecolor{commentcolor}{RGB}{0,100,0}
\definecolor{frenchplum}{RGB}{190,20,83}
\definecolor{fancycolor}{rgb}{0.5,0.5,0.5}


%% ================================================================

%% 封面
\newcommand\showcover{
  \cleardoublepage
  \thispagestyle{empty}
  \begin{flushright}
    \begingroup
    \let\small\relax
    {\zihao{4}
    \def\arraystretch{0.8}
    \begin{tabular}{rc}
      \textbf{学\hfill 号} & \@id     \\ \cline{2-2}
      \textbf{年\hfill 级} & \@grade  \\ \cline{2-2}
    \end{tabular}
    \par}
  \endgroup
  \end{flushright}
  \begin{center}
    \includegraphics[width=1.0\textwidth]{asset/img/河海大学.jpg}
    \vskip 3em
    {\zihao{-0}\coverTitleFont \@purpose \par}
    \vskip 10em
    \begingroup
      \let\small\relax
      {\zihao{3}
      \def\arraystretch{1.0}
      \begin{tabular}{r@{:}c}
        \textbf{专\hfill 业} & \@major       \\ \cline{2-2}
        \textbf{姓\hfill 名} & \@author      \\ \cline{2-2}
        \textbf{联系电话}     & \@phone       \\ \cline{2-2}
        \textbf{指导教师}     & \makebox[160pt]{\@instructor}  \\ \cline{2-2}
      \end{tabular}
      \par}
    \endgroup
    \vskip \stretch{1}
    {\zihao{3} \textbf{\@date} \par}
  \end{center}
  \clearpage
}


%% 目录
\setcounter{tocdepth}{3}  % 设置在 ToC 的显示的章节深度
\setcounter{secnumdepth}{3}  % 设置章节的编号深度
\RequirePackage[titles]{tocloft}
\renewcommand\cftdot{.}
\renewcommand\cftsecleader{\normalfont\cftdotfill{\cftdotsep}}
\renewcommand\contentsname{目录}


%% 标题
\newcommand\showcntitle{
  % \vspace*{1cm}
  % \centerline{\textbf{\zihao{-1}\@title}}
  \hei{\zihao{3} \@title}
  \vspace*{0.3cm}
}
\newcommand\showentitle{
  % \vspace*{1cm}
  % \begin{center}
  % \textbf{\zihao{-1}\@entitle}
  % \end{center}
  \timesnewroman{\textbf{\zihao{4} \@entitle}}
  \vspace*{0.3cm}
}


%% 作者
\newcommand\showauthor{
  \song{\textbf{{\zihao{5} \@author\textsuperscript{1}}}} \par
  \fangsong{
    \zihao{-5} 1. \@organization~~\@location~~\@zipcode\par
    ( \@email )
  } 
  \vspace*{0.3cm}
}
\newcommand\showenauthor{
  \timesnewroman{\textbf{{\zihao{5} NAME~\@enauthor\textsuperscript{1}}}} \par
  \timesnewroman{
    \zihao{-5} 1. \@enorganization~~\@enlocation~~\@zipcode, China\par
    ( \@email )
  } 
  \vspace*{0.3cm}
}


%% 摘要
\RequirePackage{abstract}
\renewcommand\abstractname{\zihao{-2} 摘\hspace{2em}要}
\newcommand{\showcnabstract}[1]{
  \begin{spacing}{1}
    \fangsong{\zihao{-5} \textbf{摘~要} #1}
  \end{spacing}
  \vspace*{1em}
}
\newcommand{\showenabstract}[1]{
  \begin{spacing}{1}
    \timesnewroman{\zihao{-5} \textbf{Abstract} #1}
  \end{spacing}
  \vspace*{1em}
}


%% 关键词
% \newcommand{\keywords}[1]{\vskip2ex\par\noindent\normalfont{\bfseries 关键词: } #1}
\newcommand{\showcnkeywords}[1]{
  \noindent \zihao{-5} \textbf{关键词: } #1
  \vspace*{0.8cm}
}
\newcommand{\showenkeywords}[1]{
  \noindent \zihao{-5} \textbf{Keywords: } #1
  \vspace*{0.8cm}
}


%% 正文设置
\AfterEndPreamble{
  \setstretch{1.5} % 正文行间距
  \zihao{-5} % 正文字号
}


%% 特殊feature的章节
% section 章节不标号，添加到目录
\newcommand\sectionWithoutNumbering[1]{
\section*{#1}
\addcontentsline{toc}{section}{#1}
\markboth{#1}{#1}
}
% subsubsection章节标号，不添加到目录
\newcommand\hiddensubsubsection[1]{
  \stepcounter{subsubsection}
  \noindent \textbf{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}\hspace{1em}#1}
}


%% 附录
\RequirePackage{appendix}  % 附录宏包
\RequirePackage{tocvsec2}  % 可以随处定义加入目录的级别
\newcommand\startappendix{  % 开始附录
  \clearpage
  \appendix
  \addappheadtotoc
  \appendixpage
  \settocdepth{part}  % 排除part以下内容出目录
}
\renewcommand{\appendixtocname}{附录}
\renewcommand{\appendixpagename}{附录}


%% 参考文献
\RequirePackage{gbt7714}
\citestyle{numbers}  % 使用正文模式
\bibliographystyle{gbt7714-numerical}
\renewcommand\refname{\textbf{参考文献}}  % 修改参考文献标题的字体大小
\newcommand{\addbib}[1]{
  \begin{parskiping}{1em}
    \begin{spacing}{1}
      \bibliography{#1}
    \end{spacing}
  \end{parskiping}
}


%% ================================================================

%% 链接与书签
\RequirePackage{hyperref}
\RequirePackage{bookmark}  % 用于自定义相关属性
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=true,
  linkcolor={dark},
  urlcolor={black},
  filecolor={winered},
  citecolor={winered},
  linktoc=all,
}


%% 列表
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nosep}  % 适配汉字不加过多间隙
\setlist{nolistsep}

\newlist{myitemize}{itemize}{1}
\setlist[myitemize]{label=\textbullet, leftmargin=3em}
\renewenvironment{itemize}{\begin{myitemize}}{\end{myitemize}}


%% 数学
\RequirePackage{amsthm}  % 定理
\RequirePackage{amsmath}  % 公式
\numberwithin{equation}{section}  % 按照章节标号
\RequirePackage{mathtools}  % 对amsmath的封装
\RequirePackage{siunitx}  % 单位
\RequirePackage{amssymb}  % 符号
\RequirePackage{braket}  % 内积括号

% \renewcommand{\theequation}{\arabic{section}-\arabic{equation}}
\renewcommand{\theequation}{\arabic{equation}}  % 编号
\theoremstyle{plain}
\newtheorem{theorem}{定理}[section]
\newtheorem{lemma}[theorem]{引理}
\newtheorem{proposition}[theorem]{命题}
\newtheorem*{corollary}{推论}
\theoremstyle{definition}
% \newtheorem{definition}{定义}[section]
\newtheorem{definition}{定义}[]
\newtheorem{conjecture}{猜想}[section]
\newtheorem{example}{例}[section]
\theoremstyle{remark}
\newtheorem*{remark}{\normalfont\bfseries 评论}
\newtheorem*{note}{\normalfont\bfseries 注}
\newtheorem{case}{\normalfont\bfseries 案例}
\renewcommand*{\proofname}{\normalfont\bfseries 证明}


%% 化学式
\RequirePackage{chemformula}


%% 代码
\RequirePackage{minted}  % NOTE: 需要pygments依赖(渲染工具)


%% 算法
\RequirePackage[linesnumbered,ruled,vlined]{algorithm2e}


%% 浮动体
\RequirePackage{float}  % 其它环境: float, table
\RequirePackage{caption}  % 浮动标题


%% 表格
\RequirePackage{multirow}  % 多行
\RequirePackage{multicol}  % 多列
\RequirePackage{makecell} % 单元格处理
\RequirePackage{longtable}
\RequirePackage{xtab}  % 长表格
\RequirePackage{xltabular}  % 定宽表格
\RequirePackage{booktabs}  % 书籍表格
\RequirePackage{diagbox}
\RequirePackage{arydshln}  % 表线控制
\RequirePackage{array}  % 表列格式
\RequirePackage{tabu}  % 综合应用

\renewcommand{\arraystretch}{1.5}  % 避免表格线与文字靠得太近
\newcommand{\thickhline}{
    \noalign {\ifnum 0=`}\fi \hrule height 1pt
    \futurelet \reserved@a \@xhline
} % 用于表格中的粗线
\renewcommand\tablename{表}


%% 插图
\RequirePackage{tikz}  % latex绘图
\RequirePackage{pdfpages}  % 插入PDF
\RequirePackage{graphicx}
\RequirePackage{subcaption} % 处理子图并排

\renewcommand\thesubfigure{(\alph{subfigure})}  % 将子图引用格式修改为(a)
\graphicspath{{image/}{figure/}{fig/}{img/}}
\renewcommand\figurename{图}


%% 图表相关
% 编号
\usepackage{chngcntr}
% \counterwithin{table}{section}【标号是否考虑章节】
% \counterwithin{figure}{section}

% 标题
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{enskip}{\enskip}
\captionsetup{font=small,labelsep=enskip}
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

% 工具
\newcommand\labeledCaption[1]{  % NOTE: 图表环境中label必须放在caption后面
  \caption{#1}
  \label{#1}
}


%% 辅助工具
\RequirePackage{lipsum}  % lorem ipsum
\RequirePackage{fancyvrb}  % 一系列环境配置
\RequirePackage{hologo}  % 设置类似latex那样的logo(特殊字)
\RequirePackage{verbatim}  % comment环境
\RequirePackage{bbding} % 特殊符号，例如: \checkmark

\newcommand\versiontext{版本：}  % 版本
\newcommand\updatetext{日期：}  % 日期
\newcommand\emailLink[1]{\href{mailto:#1}{\nolinkurl{#1}}}  % 邮箱


%% 中文兼容
\renewcommand\emph[1]{\textbf{#1}}  % 中文的强调

