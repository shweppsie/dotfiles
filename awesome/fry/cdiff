#
#  cdiff: coloured diff format
#
#  Paul Warren <pdw@ex-parrot.com> 
#  12/01/2001
#

#  colour for added lines (bright yellow)
diffnew=`tput setf 6``tput bold`

#  colour for removed lines (bright red)
diffold=`tput setf 4``tput bold`

#  colour for unchanged lines (bright black, aka dark grey)
diffsame=`tput setf 0``tput bold`

#  reset - original pair, unset all attributes
reset=`tput op``tput sgr0`

alias cdiff="diff --changed-group-format='%<%>'  \
	--new-group-format='%>' \
	--old-group-format='%<' \
	--new-line-format='${diffnew}+ %l
$reset' \
	--old-line-format='${diffold}- %l
$reset' \
	--unchanged-line-format='${diffsame}  %l${reset}
' "
