# 使用说明

## 环境配置

1. 安装Texlive
    - Windows: [Texlive](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/texlive.iso)
    - Linux: `sudo apt install texlive-full`
    - Mac: `brew install mactex`

2. 环境配置: 只需安装[Latex Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop), `.vscode`中的配置文件已满足常见需求


## 模版运用

- 初次使用: 克隆本仓库，按照已有的文件结构使用
- 更新模版: 下载新的[morningstar.cls](https://raw.githubusercontent.com/HenryJi529/MorningstarPaper/main/morningstar.cls`)，替换旧的即可

## 常见语法

1. 框架
    ```latex
    \documentclass[twocolumn]{morningstar}
    \title{中文标题}
    \entitle{英语标题}
    \author{作者}
    \phone{手机号}
    \email{邮箱}
    ...
    \begin{document}
    ...
    \end{document}
    ```
1. 封面
    ```latex
    \showcover
    ```
1. 前置部分
    ```latex
    \twocolumn[
    \thispagestyle{firstpage}
    \showcntitle
    \showauthor
    \showcnabstract{
        中文摘要...
    }
    \showcnkeywords{
        关键词1；关键词2；关键词3...
    }
    \showentitle
    \showenauthor
    \showenabstract{
        英文摘要...
    }
    \showenkeywords{
        keyword1; keyword2; keyword3...
    }
    ]
    ```
1. 代码
    ```latex
    % 直接插入
    \begin{minted}[linenos,mathescape]{python}
        import numpy as np
        import matplotlib.pyplot as plt 
        t = np.linspace(-3,3,200)
        y = np.sin(t)*np.exp(t)
        plt.plot(t,y,'r')
        plt.show()
    \end{minted}
    % 文件插入
    \inputminted[linenos,fontsize=\zihao{-6},mathescape,numbersep=5pt,frame=lines,firstnumber=8,highlightlines={8,10}]{python}{code/main.py}
    ```
1. 图片
    ```latex
    \begin{figure}[ht]
        \centering
        % 也可以考虑使用minipage单纯的并排(不考虑子编号)
        \begin{subfigure}[t]{0.46\textwidth}
            \centering
            \includegraphics[width=\linewidth , height=0.6\linewidth]{image/1.png}
            \caption{}
            \label{fig:1a}
        \end{subfigure}
        \begin{subfigure}[t]{0.46\textwidth}
            \centering
            \includegraphics[width=\linewidth , height=0.6\linewidth]{image/2.png}
            \caption{}
            \label{fig:1b}
        \end{subfigure}
        \caption{两图并排}
        \label{fig:1}
    \end{figure}

    \begin{figure}[htb]
        \centering
        \includegraphics[width=1.0\textwidth]{fig1.png}
        \labeledCaption{云计算服务请求模型图示}
    \end{figure}
    ```
1. 算法
    ```latex
    \begin{algorithm}[htbp]
        \setstretch{1}
        \SetKwData{server}{server}
        \SetKwInOut{Input}{input}
        \SetKwInOut{Output}{output}
        % \SetKwFunction{getvalueE}{getvalueE}
        \Input{request\_list, server\_list}
        \Output{server\_number}
        % \KwIn{request\_list, server\_list}
        % \KwOut{server\_number}
        \BlankLine
        \For{for server in server\_list}{
            function\_value = $\alpha * E(t)_i + \beta * (L_q)_i + \chi * U$\;
        }
        \emph{ascending sort of the valued of function\_value}\;
        \labeledCaption{优化算法}
    \end{algorithm}
    ```
1. 表格
    ```latex
    \begin{table}[htbp]
        \centering
        \caption{平均队列长度}
        \begin{tabular}{lcccc}
        \hline
        Service number & \makebox[60pt]{FIFO} & \makebox[60pt]{SSF} & \multicolumn{2}{c}{\makebox[100pt]{SO}}   \\
        \hline
        4                   & 892.3                 & 892.3                 & \multicolumn{2}{c}{890.6} \\
        20                  & 607.3                 & 607.3                 & \multicolumn{2}{c}{398.1} \\
        40                  & 206.2                 & 206.2                 & \multicolumn{2}{c}{0.76}  \\
        \multirow{2}{*}{60} & \multirow{2}{*}{3.39} & \multirow{2}{*}{3.39} & \makebox[50pt]{48}  & \makebox[50pt]{0.032}    \\
                            &                       &                       & 52         & 0.0013       \\
        80                  & 0.077                 & 0.077                 & 60         & 0            \\
        \hline
        \end{tabular}
        \label{table:1}
    \end{table}
    ```
1. 公式
    ```latex
    % 根据特定符号对齐
    \begin{equation}
        \begin{aligned}
        & p_1=m \rho p_0, \\
        & p_2=\frac{m^2}{2 !} \rho^2 p_0, \\
        & p_3=\frac{m^3}{3 !} \rho^3 p_0, \\
        & p_m=\frac{m^m}{m !} \rho^m p_0, \\
        & \ldots \\
        & p_{m+r}=\frac{m^m}{m !} \rho^{m+r} p_0 .
        \end{aligned}
        \label{formula:1}
    \end{equation}
    % 简单居中对齐
    \begin{equation}
        \begin{gathered}
        p_n=\frac{m^n}{n !} \rho^n p_0, \quad 0 \leq n<m, \\
        p_n=\frac{m^m}{m !} \rho^n p_0, \quad n \geq m .
        \end{gathered}
        \label{formula:2}
    \end{equation}
    % 公式过长换行
    \begin{equation}
        \begin{split}
            \vec{h}_{\mathcal{N}(i)}^{\ell} \leftarrow \text { Update }^{\ell} (\operatorname{Aggregate}(\{(\vec{h}_j^{\ell-1}, w_{i, j}^{\ell}) \mid \\ j \in \mathcal{N}(i)\}))
        \end{split}
        \label{formula:3}
    \end{equation}
    ```
1. 参考文献
    ```latex
    \cite{key1}
    \addbib{references.bib}
    ```
1. 附录
    ```latex
    \startappendix
    ```


## 周边工具

- 表格: 推荐使用[Tables Generator](https://www.tablesgenerator.com/)生成
- 公式: 推荐使用[Mathpix Snip](https://mathpix.com/)生成
- 参考文献: 
    - *.bib文件支持的文献类型
        - @book：引用一本书。
        - @article：引用一篇期刊文章。
        - @inbook：引用书中的章节或节。
        - @incollection：引用书中的章节或节，但是书是一个编辑集。
        - @inproceedings：引用会议论文。
        - @proceedings：引用会议论文集。
        - @phdthesis：引用博士论文。
        - @mastersthesis：引用硕士论文。
        - @techreport：引用技术报告。
        - @manual：引用手册或指南。
        - @misc：引用其他类型的文献。
    - ChatGPT prompt:
        ```plain
        自动为下面的参考文献生成latex的bib文件:
        [1] The Chicago Manual of Style, pages 400–401. University of Chicago Press, thirteenth edition, 1982.
        [2] Leslie Lamport. LATEX: A Document Preparation System. Addison-Wesley, 1986.
        ```
- 字数统计: 推荐安装VSCode插件[latex-wordcount](https://marketplace.visualstudio.com/items?itemName=Yongke.latex-wordcount)