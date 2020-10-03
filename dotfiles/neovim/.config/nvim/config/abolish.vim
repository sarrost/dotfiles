autocmd VimEnter * call SetupAbolish()
function SetupAbolish()
	Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or} {despe,sepa}rat{}
	Abolish teh the
	Abolish thsi this
endfunction
