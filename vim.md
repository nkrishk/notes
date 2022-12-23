Tips for CEL Environment
VI Tips
To make VI a developer-friendly tool for writing code, here are some useful plugins that can be easily installed in VI and key mappings (shortcuts) added in ~/.vimrc:
VIM Shortcuts
CTRL+P - Autocompletion in INSERT mode
NERDTree:
   One of the most powerful VI plugin. NERDTree can be installed with the following steps:
"Pathogen" is the recommended way to install NERDTree. NERDTree (or any other VIM plugins can also be installed by copying the necessary files in ~/.vim/plugins directory).
To install Pathogen issue the following commands in shell prompt.

    > mkdir -p ~/.vim/autoload ~/.vim/bundle
    > curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
Next, add this line in ~/.vimrc file:

    > vi ~/.vimrc
    execute pathogen#infect()
Pathogen is installed now.
To install NERDTree, issue the following commands in shell prompt.

    > cd ~/.vim/bundle
    > git clone https://github.com/scrooloose/nerdtree.git
NERDTree is now installed in your environment!
I have mapped F5 key to toggle NERDTree which can done by adding the line below in ~/.vimrc

    :map <F5> :NERDTreeToggle <CR>
    
TIP: Sometimes NERDTree might show weird characters in front of directory names. They can be as a result of your TERM characterset settings.
To instruct NERDTree to use simple characters, add let g:NERDTreeDirArrows=0 in your ~/.vimrc
Some Useful .vimrc Settings
Here is a list of some .vimrc settings:
First and foremost add this to highlight syntax depending on the file type. It checks more than the filename extension itself.
    :syntax enable
    filetype on
This would default to adding four spaces instead of TAB character.
    set expandtab
    set tabstop=4
For some of us it may be very very annoying when we press BACKSPACE but VIM won't delete the characters. It would insist to goto ESC mode and press X. To make VIM delete all characters like any other editor and not just the ones that were currently inserted in EDIT mode:

    > vi ~/.vimrc
    set backspace=2
The following entry would help us keep an eye of the 80 character limit 

    > vi ~/.vimrc
    set ruler
Adding these two lines below would take care of indentation in whichever way we code (in IOS way or binos cable/video way)

    > vi ~/.vimrc
    set autoindent
    set cindent
This would automagically add ending parenthesis } with proper indentation for every opening parenthesis { added inserted while writing code. (For some it may be annoying, but is very handy after getting used to it. This is true for the VI editor itself.)
inoremap { {<CR>}<up><end><CR>
Many times we would start typing code thinking we are in EDIT mode, only to realize later that all the keystrokes have been interpreted as ESC commands and VIM would have made our code really messy and worst case unrecoverable. I found adding the following in ~/.vimrc that would highlight the current line if in EDIT mode.

    > vi ~/.vimrc
    :autocmd InsertEnter * set cul
    :autocmd InsertLeave * set nocu
TIPS for .cshrc settings
To make dos like command prompt showing full directory name from root add the following line in ~/.cshrc:

    > vi ~/.cshrc
    set prompt="${HOST}%/:\!> "
It is a matter of personal taste, but it saves a lot of pwd. Now the shell prompt looks like:

mcp-cab-lwr-004/users/bthopeja:195> binos
mcp-cab-lwr-004/nobackup/bthopeja/9jun:196> cd cable/video/encryption/pme_ecmgw/src/
mcp-cab-lwr-004/nobackup/bthopeja/9jun/cable/video/encryption/pme_ecmgw/src:197> 
To make does like (and, bash like) autocompletion in shell prompts on TAB :

    > vi ~/.cshrc
    set filec
    set autolist
