set tabstop=4 softtabstop=4

set shiftwidth=4
set expandtab
set smartindent

set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set incsearch
set scrolloff=8
set noshowmode
set signcolumn=yes
set colorcolumn=80

call plug#begin('~/.vim/plugged')
    Plug 'sbdchd/neoformat'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'gruvbox-community/gruvbox'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colorscheme gruvbox

highligh Normal guibg=none

let g:neoformat_try_node_exe = 1


let mapleader = " "
nnoremap <leader>pr <cmd>Neoformat prettier <cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua require('lspconfig').html.setup{…}
lua require('lspconfig').tsserver.setup{…}
lua require('lspconfig').csharp_ls.setup{…}

fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
endfun

augroup RUSTYD2
        autocmd!
        autocmd BufWritePre * : call TrimWhitespace()
        autocmd BufWritePre *.js Neoformat
        autocmd BufWritePre *.ts Neoformat
augroup END

