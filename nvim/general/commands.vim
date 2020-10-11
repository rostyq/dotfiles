command! ClearWhitespaces %s/^\s\+$//e | %s/\s\+$//e
command! PrettifyJson %!python -m json.tool
command! CdHere chdir %:p:h
