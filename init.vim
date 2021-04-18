set encoding=utf-8
scriptencoding utf-8

let $CONFIG_DIR = $HOME.'/.config/nvim'

source $CONFIG_DIR/system.vim
source $CONFIG_DIR/display.vim
source $CONFIG_DIR/behavior.vim
source $CONFIG_DIR/keymaps.vim
if !exists('g:vscode')
	source $CONFIG_DIR/fcitx.vim
	source $CONFIG_DIR/runcode.vim
	source $CONFIG_DIR/plugins.vim
endif
