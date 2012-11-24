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

4. There is no step 4. 

Note: I do not use Commant-T anymore. CtrlP is much more awesome. 