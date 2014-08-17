"--------------------------------------------"
" Plugin: ag.vim                        :beg:"
"--------------------------------------------"
" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when available
if executable("ag")
  let g:ackprg = 'ag --nogroup --column'
  " Use ag in CtrlP for listing files.
  set grepprg=ag\ --nogroup\ --nocolor
endif
"--------------------------------------------"
" Plugin: ag.vim                        :end:"
"--------------------------------------------"

"--------------------------------------------"
" Plugin: Command-T.vim                 :beg:"
"--------------------------------------------"
" Open in split by default
let g:CommandTAcceptSelectionSplitMap = ['<C-s>','<CR>']
let g:CommandTAcceptSelectionMap      = ['<C-CR>']
let g:CommandTCancelMap               = ['<C-x>','<C-c>']
let g:CommandTMatchWindowAtTop        = 1
"--------------------------------------------"
" Plugin: Command-T.vim                 :end:"
"--------------------------------------------"

"--------------------------------------------"
" Plugin: ctrlp.vim                     :beg:"
"--------------------------------------------"
" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when available
if executable("ag")
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': [], 'AcceptSelection("t")': ['<cr>', '<c-m>'] }
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_reuse_window = 'netrw'
"--------------------------------------------"
" Plugin: ctrlp.vim                     :end:"
"--------------------------------------------"

"--------------------------------------------"
" Plugin: gist.vim                      :beg:"
"------o-------------------------------------"
" Use the right command for Gist
let os = substitute(system('uname'),"\n","","")
if os == "Darwin"
  let g:gist_clip_command = 'pbcopy'
elseif os == "Linux"
  let g:gist_clip_command = '/usr/bin/xclip -selection clipboard'
endif
"$git config --global github.user agilecreativity
if os == "Darwin" || os == "Linux"
  let g:github_token = system('cat ~/codes/bitbucket/private-dotfiles/github/github_token.txt')
endif
let g:gist_detect_filetype = 0
let g:gist_get_multiplefile = 0
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1
"-------------------------------------------"
" Plugin: gist.vim                     :end:"
"--------------------------------------=----"

"-------------------------------------------"
" Plugin: html.vim                     :beg:"
"-------------------------------------------"
let g:html_use_encoding  = "UTF-8" " force the default encoding
let g:html_use_css       = 1       " Use stylesheet instead of inline css
let g:html_number_lines  = 0       " don't show the line number
let g:html_no_pre        = 1       " don't use wrap line
let g:html_expand_tabs   = 1       " force tab to be expanded
let g:html_dynamic_folds = 1       " the user can click on toggle folds open or close, default 0
let g:html_use_xhtml     = 1       " generate XHTML 1.0 instead of HTML 4.01
let g:html_number_lines  = 1       " show line number
"-------------------------------------------"
" Plugin: html.vim                     :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: neocomplcache.vim            :beg:"
"-------------------------------------------"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_force_overwrite_completefunc = 1
"-------------------------------------------"
" Plugin: neocomplcache.vim            :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: NERDTree.vim                 :beg:"
"-------------------------------------------"
let NERDTreeIgnore =
\ [
\ '\.pyc$',
\ '\.pyo$',
\ '\.py\$class$',
\ '\.obj$',
\ '\.o$',
\ '\.so$',
\ '\.egg$',
\ '^\.git$',
\ '^\.hg$',
\ '^\.svn$',
\ '^\.idea',
\ '.min.js'
\ ]
let g:NERDTreeDirArrows=0
"-------------------------------------------"
" Plugin: NERDTree.vim                 :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: screen.vim                   :beg:"
"-------------------------------------------"
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'vim'
let g:ScreenShellQuitOnVimExit = 0
"-------------------------------------------"
" Plugin: screen.vim                   :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: tagbar.vim                   :beg:"
"-------------------------------------------"
" NOTE: exclude javascript files in :Rtags via rails.vim due to warnings when parsing
" let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Use the right ctags for the OS
let os = substitute(system('uname'),"\n","","")

if os == "Darwin"
  let g:tagbar_ctags_bin="/usr/local/bin/ctags"
elseif os == "Linux"
  let g:tagbar_ctags_bin="/usr/bin/ctags"
endif

" Index ctags from any project, including those outside Rails
map <leader>ct :!ctags -R .<cr>

" Show absolute line numbers
let g:tagbar_show_linenumbers = 2

" Let the tagbar open for all the files
let g:tagbar_autoclose = 0
"-------------------------------------------"
" Plugin: tagbar.vim                   :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: tmuxline.vim                 :beg:"
"-------------------------------------------"
" see: https://github.com/edkolev/tmuxline.vim
let g:tmuxline_theme = 'zenburn'
"-------------------------------------------"
" Plugin: tmuxline.vim                 :beg:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: ultisnips.vim                 beg:"
"-------------------------------------------"
" https://github.com/Valloric/YouCompleteMe/issues/420
function! g:UltiSnips_Complete()
  call UltiSnips_ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips_JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsEditSplit="vertical"

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"-------------------------------------------"
" Plugin: ultisnips.vim                :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: vim-airline.vim              :beg:"
"-------------------------------------------"
" see: https://github.com/bling/vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"-------------------------------------------"
" Plugin: vim-airline.vim              :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: vim-instant-markdown.vim     :beg:"
"-------------------------------------------"
" See: https://github.com/suan/vim-instant-markdown
" To disable the preview and use :InstantMarkdownPreview
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_slow = 1
"-------------------------------------------"
" Plugin: vim-instant-markdown.vim     :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: vim-jsbeautify.vim           :beg:"
"-------------------------------------------"
" See: https://github.com/maksimr/vim-jsbeautify
" TODO: create the file ~/.editorconfig
"-------------------------------------------"
" Plugin: vim-airline.vim              :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: vim-notes.vim                :beg:"
"-------------------------------------------"
" See: https://github.com/xolox/vim-notes
let g:notes_directories = [ '~/Dropbox/notes' ]
let g:notes_suffix = '.txt'
"-------------------------------------------"
" Plugin: vim-notes.vim                :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: vim-rspec.vim                :beg:"
"-------------------------------------------"
" See: https://github.com/thoughtbot/vim-rspec
let g:rspec_command="!bundle exec rspec --drb {spec}"
"-------------------------------------------"
" Plugin: vim-rspec.vim                :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: vim-snippets.vim             :beg:"
"-------------------------------------------"
" Be explicit about the snippets directory
let g:snippets_dir=$HOME.'/.vim/bundle/vim-snippets/snippets'
"-------------------------------------------"
" Plugin: vim-snippets.vim             :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: vim-surround.vim             :beg:"
"-------------------------------------------"
" let g:surround_40 = "(\r)"
" let g:surround_91 = "[\r]"
" let g:surround_60 = "<\r>"
"-------------------------------------------"
" Plugin: vim-surround.vim             :end:"
"-------------------------------------------"

"-------------------------------------------"
" Plugin: YouCompleteMe.vim            :beg:"
"-------------------------------------------"
let g:ycm_collect_identifiers_from_tags_files = 1
"-------------------------------------------"
" Plugin: YouCompleteMe.vim            :beg:"
"-------------------------------------------"
