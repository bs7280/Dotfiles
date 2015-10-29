#!/bin/bash

################################
# .install.sh
# this script creates sym links for the home directory to desired dotfiles
################################


########### Variables ##########

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc"


################################

# create dotfiles_old in homedir

echo "Creating $olddir for backup of any existing dotfiles"
mkdir -p $olddir
echo "...done"

echo "changing to dotfiles directory"
cd $dir
echo "...done"

# Move existing dotfiles in homedir to dotfiles_old directory
# Then create symlink for those files
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"

  #Moves the file
  mv ~/.$file ~/dotfiles_old/
  echo "Creating symlink to $file in homedirectory"

  #Creates the sym lin
  ln -s $dir/$file ~/.$file
done

