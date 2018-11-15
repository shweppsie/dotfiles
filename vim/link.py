#!/usr/bin/python

import os,sys, shutil

for src in ["vimrc", "vim"]:
	dst = "~/.%s" % src

	# get current dir
	workingdir = os.path.abspath(os.path.dirname(sys.argv[0]))

	# expand paths
	dst = os.path.expanduser(dst)
	src = os.path.join(workingdir,src)

	# get relative path
	src = os.path.relpath(src,dst)

	# unlink old files
	if os.path.exists(dst) or os.path.islink(dst):
		os.unlink(dst)

	print('Symlinking "%s" to "%s"' % (dst,src))
	os.symlink(src,dst)
