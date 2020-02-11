set statusline=
set statusline+=%#SignColumn#
set statusline+=\ %{FugitiveHead()}\ 

set statusline+=%#LineNr#
set statusline+=\ \ 
set statusline+=%#SignColumn#

set statusline+=\ %{WebDevIconsGetFileTypeSymbol()}\ %f\ 

set statusline+=%#LineNr#
set statusline+=\ \ 
set statusline+=%#SignColumn#

set statusline+=%m
set statusline+=%#LineNr#
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]\  

set statusline+=%#SignColumn#
set statusline+=%4c\ 
set statusline+=%#LineNr#
set statusline+=\ \ 

set statusline+=%#SignColumn#
set statusline+=%5l\ 
set statusline+=%#LineNr#
set statusline+=\ /\ 

set statusline+=%#SignColumn#
set statusline+=\ %4L\ 
set statusline+=%#LineNr#
set statusline+=\ \ 

set statusline+=%#SignColumn#
set statusline+=%4p%%\ 
set statusline+=%#LineNr#
set statusline+=\ \ 
