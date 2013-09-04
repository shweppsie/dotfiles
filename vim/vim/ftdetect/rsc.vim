
let s:first_line = getline(1)
if      s:first_line =~ "^#.* by RouterOS"
        setfiletype rsc
endif
unlet s:first_line

au BufRead,BufNewFile *.rsc setfiletype rsc
