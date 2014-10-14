#!/bin/bash
cd ~
cd `find -name Awesomenauts-AI-Build-System`

if [ `ls | grep -c config.yml` = 0 ]; then
  touch config.yml
fi
if [ `ls | grep -c src` = 0 ]; then
  mkdir src
fi
if [ `ls | grep -c patch` = 0 ]; then
  mkdir patch
fi
if [ `ls patch | grep -c patchfiles` = 0 ]; then
  mkdir patch/patchfiles
fi
if [ `ls patch | grep -c new` = 0 ]; then
  mkdir patch/new
fi
if [ `ls patch/new | grep -c README.md` = 0 ]; then
  touch patch/new/README.md
fi
if [ `ls patch | grep -c fixme` = 0 ]; then
  mkdir patch/fixme
fi
if [ `ls patch/fixme | grep -c README.md` = 0 ]; then
  touch patch/fixme/README.md
fi
if [ `ls | grep -c dependencies` = 0 ]; then
  mkdir dependencies
fi
if [ `ls dependencies | grep -c old` = 0 ]; then
  mkdir dependencies/old
fi
if [ `ls | grep -c release` = 0 ]; then
  mkdir release
fi
if [ `ls | grep -c bin` = 0 ]; then
  mkdir bin
fi

# config.yml
echo \
'# Awesomenauts installation location
install-dir:

# Aliases to AI directories
# ex:
#   aliases:
#     FoxAI -> Assassin
#     SentryAI -> Spy
aliases:' \
>> config.yml

# patch/new/README.md
echo \
'Copy your dependency into this directory and modifiy it as you wish. After it
is as you like, run *script/update.sh* to create the patch. This will remove
your new file, but you can always find a backup in *dependencies/old* after
building.' \
>> patch/new/README.md

# patch/fixme/README.md
echo \
'Upon the application of a broken patch, the broken files, as well as some
debug files, are dumped into this directory. To fix the patch, modify the XML
file dumped to repair it. Then, run *update.sh* to fix your patch.' \
>> patch/fixme/README.md

echo 'Initialization complete. Follow README.md for instructions to use the
Build System'
