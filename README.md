Awesomenauts AI Build System
============================
The Awesomenauts AI Build System is an environment designed for creating
Awesomenauts AI's. The goal of this project is to automate as much of the AI
creation and distribution process as possible. This will result in improved
efficiency in the creation process.

The AI Build System performs the following tasks:
* Manages dependencies
* Creates and applies patches to dependency files
* Handles patching failures and notifies the user when they occur
* Installs AIs for testing
* Packages AIs for distribution

Directory structure
-------------------
* README.md -- provides instructions for using the AI Build System and
  a specification for it
* .gitignore -- Aids in the development of this project. In most cases, it can
  safely be ignored.
* config.yml -- User-specific configuration.
* script/ -- Contains script files for automatic AI creation tasks.
    * bootstrap.sh -- Sets up the modder's environment for AI creation.
    * build.sh -- Builds AI files and puts them in bin/.
    * update.sh -- Updates patches to dependencies.
    * install.sh -- Installs AI's.
    * package.sh -- Packages AI's for release.
* src/ -- Contains the directories for AI-specific files.
* patch/ -- Contains patches and patch-related files.
    * patchfiles/ -- Patch files.
    * new/ -- Modified versions of dependencies. Run *update.sh* to create
      patches from these.
        * README.md -- Instructions for creating patches.
    * fixme/ -- Files related to failed patches.
        * README.md -- Instructions for fixing patches.
* dependencies/ -- Dependencies not found in the game's *ExampleAIs* folder.
    * old/ -- Holds backups of dependencies in case patches break.
* release/ -- Contains zip files for distribution.
* bin/ -- Contains AI build files. In most cases, this can be ignored. However,
  you can have a look inside after building if you are curious.

Usage
-----
*WARNING*: please run all scripts for this tool from it's root directory.
If you do not, it will not now where to place files.
1. Upon downloading the AI Build System, you should extract it to somewhere on
   your computer. The location does not matter, and this can be moved later on.
   Do not rename the folder.
2. Upon extracting the Build System, you should notice that some files and
   directories are missing. Run *script/bootstrap.sh* to create them.
3. Edit *config.yml* in an editor of your choice. Do not proceed until you are
   certain your environment is properly configured.
4. Place your AI files in subdirectories of *src/*. It does not matter what the
   directories are named, but I recommend keeping names short. You will need to
   type out these names to build the AIs.
5. Run *script/bootstrap.sh* again. This will create a file called *deps.yml*
   in your AI's directory. Edit it to name dependencies for your AI.
6. If you made any modifications to dependencies, place the modified versions
   in *patch/new/*. Then, run *script/update.sh* to create the patches.
7. Run *script/install.sh* to install your AI. If patching fails, go to
   *patches/fixme* to fix your patch.
8. Continue to make modifications, reinstall, and update patchfiles until your
   are satisfied. Once you want to release a new version of your AI, run
   *script/package.sh* to build a release. You can find the zip file for
   distribution in *release/*.
