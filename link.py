#!/usr/bin/env python

import os,sys, shutil

files = [
    "vim/vimrc",
    "vim/vim",
    "git/gitconfig",
    "bash/bashrc",
    "bash/bin",
]

for src in files:
    dst = "~/.%s" % os.path.basename(src)

    # get current dir
    workingdir = os.path.abspath(os.path.dirname(sys.argv[0]))

    # expand paths
    dst = os.path.expanduser(dst)
    src = os.path.join(workingdir,src)

    dst_dir = os.path.dirname(dst)

    # get relative path
    src = os.path.relpath(src,dst_dir)

    if not os.path.exists(dst_dir):
        os.makedirs(dst_dir)

    # unlink old files
    if os.path.exists(dst) or os.path.islink(dst):
        if os.path.isdir(dst):
            shutil.rmtree(dst)
        else:
            os.unlink(dst)

    print('Symlinking "%s" to "%s"' % (dst,src))
    os.symlink(src,dst)
