#!/bin/bash
LOCATION=$(find ~ -name Awesomenauts-AI-Build-System)
cd "$LOCATION"

if [ ! -f config.yml ]; then
  touch config.yml
fi
if [ ! -d src ]; then
  mkdir src
fi
if [ ! -d patch ]; then
  mkdir patch
fi
if [ ! -d patch/patchfiles ]; then
  mkdir patch/patchfiles
fi
if [ ! -d patch/new ]; then
  mkdir patch/new
fi
if [ ! -f patch/new/README.md ]; then
  touch patch/new/README.md
fi
if [ ! -d patch/fixme ]; then
  mkdir patch/fixme
fi
if [ ! -f patch/fixme/README.md ]; then
  touch patch/fixme/README.md
fi
if [ ! -d dependencies ]; then
  mkdir dependencies
fi
if [ ! -d dependencies/old ]; then
  mkdir dependencies/old
fi
if [ ! -d release ]; then
  mkdir release
fi
if [ ! -d bin ]; then
  mkdir bin
fi

# config.yml
if [ "$(grep -c install-dir < config.yml)" = 0 ]; then
echo '# Awesomenauts installation location
install-dir:

# Awesomenauts Build System location
location: '"$LOCATION"'

# Aliases to AI directories
# ex:
#   aliases:
#     FoxAI: Assassin
#     SentryAI: Spy
aliases:' \
>> config.yml
fi

# patch/new/README.md
if [ "$(grep -c Copy < patch/new/README.md)" = 0 ]; then
echo 'Copy your dependency into this directory and modifiy it as you wish.
After it is as you like, run *script/update.sh* to create the patch. This will
remove your new file, but you can always find a backup in *dependencies/old*
after building.' \
>> patch/new/README.md
fi

# patch/fixme/README.md
if [ "$(grep -c Upon < patch/fixme/README.md)" = 0 ]; then
echo 'Upon the application of a broken patch, the broken files, as well as some
debug files, are dumped into this directory. To fix the patch, modify the XML
file dumped to repair it. Then, run *update.sh* to fix your patch.' \
>> patch/fixme/README.md
fi

for i in src/*/; do
  if [ ! -f "${i}"/deps.yml ]; then
    touch "${i}"/deps.yml
    echo \
'# Add dependencies for your AI to this file. If your dependencies are patched,
# use the name of the patch instead of the dependency.
#
# ex:
# dependencies: {VeankoAI, VeankoCheckIfEnemyInCombatRange_Dasher}

dependencies: {}' \
    >> "${i}"/deps.yml
  fi
done

echo 'Initialization complete. Follow README.md for instructions to use the
Build System'
