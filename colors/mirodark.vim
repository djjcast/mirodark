" Vim Color File {{{
"
" Name:        mirodark
" Version:     0.1
" Last Change: 11-14-2011
" Maintainer:  Jerome O Castaneda <djjcast@gmail.com>
" URL:         https://github.com/djjcast/mirodark
"
" About:       mirodark extends Jason W Ryan's miromiro(1) Vim color file with gVim and Linux
"              console support. mirodark uses Jason W Ryan's dark(2) terminal color scheme colors.
"
"              1) https://bitbucket.org/jasonwryan/eeepc/src/40f27908ce98/.vim/colors/miromiro.vim
"              2) https://bitbucket.org/jasonwryan/eeepc/src/40f27908ce98/.colours/dark
"
" }}}

" Usage Notes {{{
"
" Installation:
"
" 1) Add mirodark.vim to your ~/.vim/colors directory.
" 2) Add the following to your ~/.vimrc file:
"
"     syntax on
"     colorscheme mirodark
"
" Terminal Support:
"
" 1) Add the following to your ~/.Xresources file:
"
"     !
"     ! Terminal Color Scheme: dark
"     !
"     ! Maintainer: Jason W Ryan <http://jasonwryan.com/>
"     !
"     *background: #121212
"     *foreground: #999999
"     ! black dark/light
"     *color0:     #3d3d3d
"     *color8:     #5e5e5e
"     ! red dark/light
"     *color1:     #8a2f58
"     *color9:     #cf4f88
"     ! green dark/light
"     *color2:     #287373
"     *color10:    #53a6a6
"     ! yellow dark/light
"     *color3:     #914e89
"     *color11:    #bf85cc
"     ! blue dark/light
"     *color4:     #395573
"     *color12:    #4779b3
"     ! magenta dark/light
"     *color5:     #5e468c
"     *color13:    #7f62b3
"     ! cyan dark/light
"     *color6:     #2b7694
"     *color14:    #47959e
"     ! white dark/light
"     *color7:     #899ca1
"     *color15:    #c0c0c0    
"
" Linux Console Support:
"
" 1) Add the following to your ~/.bashrc file:
"
"     #
"     # Linux Console Color Scheme: dark
"     #
"     # Maintainer: Jason W Ryan <http://jasonwryan.com/>
"     #
"     if [ "$TERM" = "linux" ]; then
"         echo -en "\033]P0000000" # black
"         echo -en "\033]P85e5e5e"
"         echo -en "\033]P18a2f58" # red
"         echo -en "\033]P9cf4f88"
"         echo -en "\033]P2287373" # green
"         echo -en "\033]Pa53a6a6"
"         echo -en "\033]P3914e89" # yellow
"         echo -en "\033]Pbbf85cc"
"         echo -en "\033]P4395573" # blue
"         echo -en "\033]Pc4779b3"
"         echo -en "\033]P55e468c" # magenta
"         echo -en "\033]Pd7f62b3"
"         echo -en "\033]P62b7694" # cyan
"         echo -en "\033]Pe47959e"
"         echo -en "\033]P7899ca1" # white
"         echo -en "\033]Pfc0c0c0"
"     fi
" }}}

" color scheme initialization {{{
set background=dark
hi clear
if exists("syntax on")
    syntax reset
endif
let colors_name="mirodark"
" }}}

" color scheme variables {{{
if has("gui_running")
    let s:venv="gui"     " vim environment (term, cterm, gui)
    let s:bclr="#121212" " background color
    let s:fclr="#999999" " foreground color
    let s:dblk="#3d3d3d" " dark black    (color 0)
    let s:lblk="#5e5e5e" " light black   (color 8)
    let s:dred="#8a2f58" " dark red      (color 1)
    let s:lred="#cf4f88" " light red     (color 9)
    let s:dgrn="#287373" " dark green    (color 2)
    let s:lgrn="#53a6a6" " light green   (color 10)
    let s:dylw="#914e89" " dark yellow   (color 3)
    let s:lylw="#bf85cc" " light yellow  (color 11)
    let s:dblu="#395573" " dark blue     (color 4)
    let s:lblu="#4779b3" " light blue    (color 12)
    let s:dmag="#5e468c" " dark magenta  (color 5)
    let s:lmag="#7f62b3" " light magenta (color 13)
    let s:dcyn="#2b7694" " dark cyan     (color 6)
    let s:lcyn="#47959e" " light cyan    (color 14)
    let s:dwht="#899ca1" " dark white    (color 7)
    let s:lwht="#c0c0c0" " light white   (color 15)
elseif &t_Co >= 16
    let s:venv="cterm"
    let s:bclr=""
    let s:fclr=""
    let s:dblk="0"
    let s:lblk="8"
    let s:dred="1"
    let s:lred="9"
    let s:dgrn="2"
    let s:lgrn="10"
    let s:dylw="3"
    let s:lylw="11"
    let s:dblu="4"
    let s:lblu="12"
    let s:dmag="5"
    let s:lmag="13"
    let s:dcyn="6"
    let s:lcyn="14"
    let s:dwht="7"
    let s:lwht="15"
elseif &t_Co == 8
    let s:venv="cterm"
    let s:bclr=""
    let s:fclr=""
    let s:dblk="Black"
    let s:lblk="DarkGray"
    let s:dred="DarkRed"
    let s:lred="LightRed"
    let s:dgrn="DarkGreen"
    let s:lgrn="LightGreen"
    let s:dylw="DarkYellow"
    let s:lylw="LightYellow"
    let s:dblu="DarkBlue"
    let s:lblu="LightBlue"
    let s:dmag="DarkMagenta"
    let s:lmag="LightMagenta"
    let s:dcyn="DarkCyan"
    let s:lcyn="LightCyan"
    let s:dwht="LightGray"
    let s:lwht="White"
endif
" }}}

" highlight wrapper function {{{
fun! s:HI(group, bg, fg, attr)
    exec "hi" a:group
                \ . " " . (a:bg   != "" ? s:venv . "bg=" . a:bg   : "")
                \ . " " . (a:fg   != "" ? s:venv . "fg=" . a:fg   : "")
                \ . " " . (a:attr != "" ? s:venv . "="   . a:attr : "")
endfun
" }}}

" normal colors {{{
call s:HI(         "Normal", s:bclr, s:lwht,        "" )
call s:HI(         "Ignore",     "", s:lblk,        "" )
call s:HI(        "Comment",     "", s:dwht,        "" )
call s:HI(         "LineNr",     "", s:lblk,        "" )
call s:HI(          "Float",     "", s:dylw,        "" )
call s:HI(        "Include",     "", s:dmag,        "" )
call s:HI(         "Define",     "", s:dgrn,        "" )
call s:HI(          "Macro",     "", s:lmag,        "" )
call s:HI(        "PreProc",     "", s:lgrn,        "" )
call s:HI(      "PreCondit",     "", s:lmag,        "" )
call s:HI(        "NonText",     "", s:dcyn,        "" )
call s:HI(      "Directory",     "", s:dcyn,        "" )
call s:HI(     "SpecialKey",     "", s:lylw,        "" )
call s:HI(           "Type",     "", s:dcyn,        "" )
call s:HI(         "String",     "", s:dgrn,        "" )
call s:HI(       "Constant",     "", s:lmag,        "" )
call s:HI(        "Special",     "", s:lgrn,        "" )
call s:HI(    "SpecialChar",     "", s:lred,        "" )
call s:HI(         "Number",     "", s:lcyn,        "" )
call s:HI(     "Identifier",     "", s:lmag,        "" )
call s:HI(    "Conditional",     "", s:lcyn,        "" )
call s:HI(         "Repeat",     "", s:lred,        "" )
call s:HI(      "Statement",     "", s:dblu,        "" )
call s:HI(          "Label",     "", s:lmag,        "" )
call s:HI(       "Operator",     "", s:dylw,        "" )
call s:HI(        "Keyword",     "", s:lred,        "" )
call s:HI(   "StorageClass",     "", s:lylw,        "" )
call s:HI(      "Structure",     "", s:dmag,        "" )
call s:HI(        "Typedef",     "", s:dcyn,        "" )
call s:HI(       "Function",     "", s:lylw,        "" )
call s:HI(      "Exception",     "", s:dred,        "" )
call s:HI(     "Underlined",     "", s:dblu,        "" )
call s:HI(          "Title",     "", s:dylw,        "" )
call s:HI(            "Tag",     "", s:lylw,        "" )
call s:HI(      "Delimiter",     "", s:lblu,        "" )
call s:HI( "SpecialComment",     "", s:lred,        "" )
call s:HI(        "Boolean",     "", s:dylw,        "" )
call s:HI(           "Todo", "NONE", s:lred,        "" )
call s:HI(        "MoreMsg", "NONE", s:lmag,        "" )
call s:HI(        "ModeMsg", "NONE", s:lmag,        "" )
call s:HI(          "Debug", "NONE", s:dred,        "" )
call s:HI(     "MatchParen", s:dwht, s:dblk,        "" )
call s:HI(       "ErrorMsg", "NONE", s:dred,        "" )
call s:HI(       "WildMenu", s:lwht, s:dmag,        "" )
call s:HI(         "Folded", s:dblk, s:dcyn, "reverse" )
call s:HI(         "Search", s:lwht, s:dred,        "" )
call s:HI(      "IncSearch", s:lwht, s:dred,        "" )
call s:HI(     "WarningMsg", s:lwht, s:dred,        "" )
call s:HI(       "Question", s:lwht, s:lgrn,        "" )
call s:HI(          "Pmenu", s:lwht, s:dgrn,        "" )
call s:HI(       "PmenuSel", s:lwht, s:dred,        "" )
call s:HI(         "Visual", s:lwht, s:lblk,        "" )
call s:HI(     "StatusLine", s:dwht, s:dblk,        "" )
call s:HI(   "StatusLineNC", s:dblk, s:lblk,        "" )
" }}}

" specific for vim script {{{
call s:HI( "vimCommentTitle",     "", s:lgrn, "" )
call s:HI(         "vimFold", s:lwht, s:dblk, "" )
" }}}

" specific for help files {{{
call s:HI( "helpHyperTextJump", "", s:lylw, "" )
" }}}

" js numbers only {{{
call s:HI( "javaScriptNumber", "", s:lylw, "" )
" }}}

" special for html {{{
call s:HI(     "htmlTag", "", s:dcyn, "" )
call s:HI(  "htmlEndTag", "", s:dcyn, "" )
call s:HI( "htmlTagName", "", s:lylw, "" )
" }}}

" specific for perl {{{
call s:HI(        "perlSharpBang", "", s:lgrn, "standout" )
call s:HI(        "perlStatement", "", s:lmag,         "" )
call s:HI( "perlStatementStorage", "", s:dred,         "" )
call s:HI(         "perlVarPlain", "", s:dylw,         "" )
call s:HI(        "perlVarPlain2", "", s:lylw,         "" )
" }}}

" specific for ruby {{{
call s:HI( "rubySharpBang", "", s:lgrn, "standout" )
" }}}

" specific for diff {{{
call s:HI(    "diffLine", "", s:lgrn, "" )
call s:HI( "diffOldLine", "", s:dgrn, "" )
call s:HI( "diffOldFile", "", s:dgrn, "" )
call s:HI( "diffNewFile", "", s:dgrn, "" )
call s:HI(   "diffAdded", "", s:dblu, "" )
call s:HI( "diffRemoved", "", s:dred, "" )
call s:HI( "diffChanged", "", s:dcyn, "" )
" }}}

" spell checking {{{
if version >= 700
    hi clear SpellBad
    hi clear SpellCap
    hi clear SpellRare
    hi clear SpellLocal
    call s:HI(   "SpellBad", "", "", "underline" )
    call s:HI(   "SpellCap", "", "", "underline" )
    call s:HI(  "SpellRare", "", "", "underline" )
    call s:HI( "SpellLocal", "", "", "underline" )
endif
" }}}
