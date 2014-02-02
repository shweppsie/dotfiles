#!/usr/bin/python

import os,sys

filename = "bashrc"
dest = "~/.bashrc"

dest = os.path.expanduser(dest)

if os.path.exists(dest) or os.path.islink(dest):
	os.unlink(dest)

workingdir = os.path.abspath(os.path.dirname(sys.argv[0]))

os.symlink(os.path.join(workingdir,filename),dest)

filename = "vcprompt"
dest = "~/.bin/vcprompt"

dest = os.path.expanduser(dest)
if not os.path.exists(os.path.dirname(dest)):
    os.mkdir(os.path.dirname(dest))

if os.path.exists(dest) or os.path.islink(dest):
	os.unlink(dest)

workingdir = os.path.abspath(os.path.dirname(sys.argv[0]))

os.symlink(os.path.join(workingdir,filename),dest)

