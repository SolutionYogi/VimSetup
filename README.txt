This repository contains my Vim configuration file.

As I work on Windows exclusively, my configuration may contain settings which are only applicable for Windows. 

Feel free to steal anything you like from this file. 

Instructions:

1. Create folder C:\VimSetup

2. Sync this repository in folder created in step 1.

3. Modify your main _vimrc (Located in C:\Program Files\Vim) to read like below:

  set nocompatible
  
  set runtimepath+=c:\VimSetup
  
  source c:\vimsetup\_vimrc

4. Clone Vundle repository https://github.com/gmarik/vundle in C:\Vundle folder. [If you change the path, modify C:\VimSetup\_vimrc to reflect the matching path.)

5. When Vim starts for the first time, run :BundleInstall command to install all the bundles. 

6. There is no Step 6! :)

Note: I do not use Commant-T anymore. CtrlP is much more awesome. 