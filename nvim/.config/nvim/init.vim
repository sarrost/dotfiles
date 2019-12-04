""" Load config files.
let s:config_dir = '$HOME/.config/nvim/config/'
for filename in s:config_files
let s:config_files = [ 'settings.vim', 'mappings_normal.vim' ]
    exec 'source ' . s:config_dir . filename
endfor
