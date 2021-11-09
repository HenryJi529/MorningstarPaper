# @ 不回显命令
# - 忽略错误继续执行
LATEX=xelatex  # 更好的支持非拉丁字母
BIBTEX=bibtex
LATEXOPT=--shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf
PAPER=paper
CLASS=morningstar

# 关键文件
TEX=$(PAPER).tex
BIB=$(PAPER).bib
CLS=$(CLASS).cls

# 中间产物

AUX=$(PAPER).aux
BBL=$(PAPER).bbl
BLG=$(PAPER).blg
LOG=$(PAPER).log
SYNC=$(PAPER).synctex.gz
TOC=$(PAPER).toc

build: $(TEX) $(BIB) $(CLS)
	@$(LATEX) $(LATEXOPT) $(TEX)
	@$(BIBTEX) $(PAPER)  
	@$(LATEX) $(LATEXOPT) $(TEX)
	@$(LATEX) $(LATEXOPT) $(TEX)

clean: 
	-rm $(AUX) $(BBL) $(BLG) $(LOG) $(SYNC) $(TOC)

once: $(TEX) $(BIB) $(CLS)
	@$(LATEX) $(LATEXOPT) $(TEX)

full: clean build

