#!/usr/bin/python

import os,sys

filename = "vimrc"
dest = "~/.vimrc"

dest = os.path.expanduser(dest)

if os.path.exists(dest) or os.path.islink(dest):
	os.unlink(dest)

workingdir = os.path.abspath(os.path.dirname(sys.argv[0]))

os.symlink(os.path.join(workingdir,filename),dest)

