syntax on
set backupdir=~/.vim/backups
set number
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set linebreak
set hlsearch
call plug#begin()
Plug 'junegunn/goyo.vim'
"Plug 'ying17zi/vim-live-latex-preview'
"Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'xuhdev/vim-latex-live-preview'
Plug 'vim-scripts/supertab'
Plug 'vim-scripts/c.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'lekv/vim-clewn'
Plug 'terryma/vim-smooth-scroll'
Plug 'klen/python-mode'
Plug 'joonty/vim-do'
Plug 'skywind3000/asyncrun.vim'
call plug#end()
filetype plugin on

"""BASIC TOOLS
"Navigating with guides
inoremap <Space><Space> <Esc>/<++><Enter>4xa
"vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
map <Space><Space> <Esc>/<++><Enter>4xa
noremap <F2> :!gpg -d %<CR>
noremap <F3> :redraw!<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 3)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 3)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 3)<CR>
noremap <silent> <F12> <C-w>v:e ~/bakule/blackwater.md<CR><C-w><C-w>:e ~/bakule/bakule.rmd<CR><C-w>K
nmap <silent> <C-j> :wincmd h<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd j<CR>
nmap <silent> <C-ů> :wincmd l<CR>
map YY :wq<Enter>
inoremap ;gui <++>
"For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
noremap l j
noremap j h
noremap ů l
noremap gl gj
noremap L J
"Spell-check set to F7
map <F7> :setlocal spell! spelllang=en_us<CR>
map <F8> :set spell! spelllang=cs<CR>
inoremap <C-l> <Space><Space>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"""END
let g:clang_use_library = 1
let g:clang_library_path='/usr/lib/llvm-3.9/lib/'
"""LATEX
"let g:livepreview_engine = '/usr/bin/zathura'
"let g:neotex_enabled = 1
"let g:neotex_delay = 1000
let g:livepreview_previewer = 'zathura'
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;it \textit{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;ct \citet{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;p \citep{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;t \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;tab \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{%DELRN%}<Enter><++><Enter>\end{%DELRN%}<Enter><Enter><++><Esc>4kfR:MultipleCursorsFind<Space>%DELRN%<Enter>c
"autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
"""END

"""Logical Symbols
autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;M $$$$<Enter><Enter><++><Esc>2k$hi
autocmd FileType tex inoremap ;neg {\neg}
autocmd FileType tex inoremap ;V {\vee}
autocmd FileType tex inoremap ;or {\vee}
autocmd FileType tex inoremap ;L {\wedge}
autocmd FileType tex inoremap ;and {\wedge}
autocmd FileType tex inoremap ;ra {\rightarrow}
autocmd FileType tex inoremap ;la {\leftarrow}
autocmd FileType tex inoremap ;lra {\leftrightarrow}
autocmd FileType tex inoremap ;fa {\forall}
autocmd FileType tex inoremap ;ex {\exists}
autocmd FileType tex inoremap ;dia	{\Diamond}
autocmd FileType tex inoremap ;box	{\Box}
"""END

autocmd Filetype tex inoremap ;nom {\textsc{nom}}
autocmd FileType tex inoremap ;acc {\textsc{acc}}
autocmd FileType tex inoremap ;dat {\textsc{dat}}
autocmd FileType tex inoremap ;gen {\textsc{gen}}
autocmd FileType tex inoremap ;abl {\textsc{abl}}
autocmd FileType tex inoremap ;voc {\textsc{voc}}
autocmd FileType tex inoremap ;loc {\textsc{loc}}
autocmd Filetype tex inoremap ;inst {\textsc{inst}}
"autocmd FileType tex inoremap ;

"""IPA
autocmd FileType tex inoremap ;tipa \textipa{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;ae {\ae}
autocmd FileType tex inoremap ;A {\textscripta}
autocmd FileType tex inoremap ;dh {\dh}
autocmd FileType tex inoremap ;yogh {\textyogh}
autocmd FileType tex inoremap ;j {\textdyoghlig}
autocmd FileType tex inoremap ;uh {\textschwa}
autocmd FileType tex inoremap ;eps {\textepsilon}
autocmd FileType tex inoremap ;gam {\textgamma}
autocmd FileType tex inoremap ;I {\textsci}
autocmd FileType tex inoremap ;sh {\textesh}
autocmd FileType tex inoremap ;th {\texttheta}
autocmd FileType tex inoremap ;ups {\textupsilon}
autocmd FileType tex inoremap ;ph {\textphi}
autocmd FileType tex inoremap ;om {\textomega}
autocmd FileType tex inoremap ;sig {\textsigma}
autocmd FileType tex inoremap ;oe {\oe}
autocmd FileType tex inoremap ;ng {\ng}
autocmd FileType tex inoremap ;au {\textopeno}
autocmd FileType tex inoremap ;O {\textopeno}
autocmd FileType tex inoremap ;glot {\textglotstop}
autocmd FileType tex inoremap ;ch {\textteshlig}
autocmd FileType tex inoremap ;li \item 
"""END

"""HTML
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ;h1 <h1></h1><Enter><Enter><p><++><Esc>2k2hi
autocmd FileType html inoremap ;h2 <h2></h2><Enter><Enter><p><++><Esc>2k2hi
autocmd FileType html inoremap ;h3 <h3></h3><Enter><Enter><p><++><Esc>2k2hi
autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>F"i
autocmd FileType html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ;li <Esc>o<li></li><Esc>F>a
autocmd FileType html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i

"""END

""".bib
autocmd FileType bib inoremap ;a @article{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>journal<Space>=<Space>"<++>",<Enter><Tab>volume<Space>=<Space>"<++>",<Enter><Tab>pages<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ;b @book{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>publisher<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap ;c @incollection{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>booktitle<Space>=<Space>"<++>",<Enter><Tab>editor<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>publisher<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>8kA,<Esc>i
"""END

let g:vim_rmd_new_list_item_indent = 0
autocmd Filetype rmd inoremap ;b ****<Space><++><Esc>F*hi
autocmd Filetype rmd inoremap ;s ~~~~<Space><++><Esc>F~hi
autocmd Filetype rmd inoremap ;e **<Space><++><Esc>F*i
autocmd Filetype rmd inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype rmd inoremap ;i ![](<++>)<Space><++><Esc>F[a
autocmd Filetype rmd inoremap ;a [](<++>)<Space><++><Esc>F[a
autocmd Filetype rmd inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype rmd inoremap ;l --------<Enter>
autocmd Filetype rmd map <F5> :w<Enter>:AsyncRun pandoc<space><C-r>%<space>-o<space>%:p:h/'%:t:r'.pdf<enter>:redraw!<enter>

autocmd Filetype rmd inoremap "" „“<Space><++><Esc>F„a
autocmd Filetype rmd inoremap '' ,‘<Space><++><Esc>F,a

