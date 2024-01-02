:set number
:set relativenumber 
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline' " Status barg
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
"Plug 'kyazdani42/nvim-web-devicons' "Devloper Icons with color
Plug 'tc50cal/vim-terminal' " Vim Terminalg
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'projekt0n/github-nvim-theme' " For github theme

call plug#end()

:set completeopt-=preview " For No Previews

" Set Color Scheme
:colorscheme github_dark 

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" ------- nvim Configs -----------
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

" -------- Split Configs ---------
:set splitbelow splitright

"Remap split navigation easy
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l

" Make adjustment to resize maping
noremap <silent> <C-Left> :vertical resize +3 <CR>
noremap <silent> <C-Right> :vertical resize -3 <CR>
noremap <silent> <C-Up> :resize +3 <CR>
noremap <silent> <C-Down> :resize -3 <CR>

" change 2 split windows from vertical to horizontal or horizontal to vertical
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K


" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" ------- Plug In Configs --------
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

" ------ Tagbar Config -----------
nmap <F8> :TagbarToggle<CR>

" ------ NerdTree Config ---------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=1

