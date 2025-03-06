#!/bin/bash
cd $HOME/vimwiki
/usr/bin/git --git-dir=$HOME/.vimwiki/ --work-tree=$HOME/vimwiki add . 
/usr/bin/git --git-dir=$HOME/.vimwiki/ --work-tree=$HOME/vimwiki commit -m "backup"
/usr/bin/git --git-dir=$HOME/.vimwiki/ --work-tree=$HOME/vimwiki push
