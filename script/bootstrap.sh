#!/bin/bash
cd "$(find ~ -name Awesomenauts-AI-Build-System)"

if [ ! -f config.sh ]; then
  touch config.sh
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

# config.sh
if [ "$(grep -c install-dir < config.sh)" = 0 ]; then
echo "# Awesomenauts installation location
install-dir=$(find ~ -name Awesomenauts)

# Aliases to AI directories
# ex:
#   FoxAI=Assassin
#   SentryAI=Spy" \
>> config.sh
fi

# patch/new/README.md
if [ "$(grep -c Copy < patch/new/README.md)" = 0 ]; then
echo "Copy your dependency into this directory and modifiy it as you wish.
After it is as you like, run *script/update.sh* to create the patch. This will
remove your new file, but you can always find a backup in *dependencies/old*
after building." \
>> patch/new/README.md
fi

# patch/fixme/README.md
if [ "$(grep -c Upon < patch/fixme/README.md)" = 0 ]; then
echo "Upon the application of a broken patch, the broken files, as well as some
debug files, are dumped into this directory. To fix the patch, modify the XML
file dumped to repair it. Then, run *update.sh* to fix your patch." \
>> patch/fixme/README.md
fi

for i in src/*/; do
  if [ ! -f "${i}"/deps.sh ]; then
    touch "${i}"/deps.sh
    echo \
"# Add dependencies for your AI to this file. If your dependencies are patched,
# use the name of the patch instead of the dependency.
#
# ex:
# dependencies[1]=VeankoAI
# dependencies[2]=VeankoCheckIfEnemyInCombatRange_Dasher" \
    >> "${i}"/deps.sh
  fi
done

echo "Initialization complete. Follow README.md for instructions to use the
Build System"
