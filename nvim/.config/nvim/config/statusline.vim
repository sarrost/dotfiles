set statusline=
set statusline+=%#TabLineSel#
set statusline+=\ %{FugitiveHead()}\ 

set statusline+=%#LineNr#
set statusline+=\ \ 
set statusline+=%#TabLineSel#

set statusline+=\ %{WebDevIconsGetFileTypeSymbol()}\ %f\ 

set statusline+=%#LineNr#
set statusline+=\ \ 
set statusline+=%#TabLineSel#

set statusline+=%m
set statusline+=%#LineNr#
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]\  

set statusline+=%#TabLineSel#
set statusline+=%4c\ 
set statusline+=%#LineNr#
set statusline+=\ \ 

set statusline+=%#TabLineSel#
set statusline+=%5l\ 
set statusline+=%#LineNr#
set statusline+=\ /\ 

set statusline+=%#TabLineSel#
set statusline+=\ %4L\ 
set statusline+=%#LineNr#
set statusline+=\ \ 

set statusline+=%#TabLineSel#
set statusline+=%4p%%\ 
set statusline+=%#LineNr#
set statusline+=\ \ 
