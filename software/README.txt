Command-T installation Instructions for Vim 7.3 and Windows 7

1. Clone VimSetup repository in {C:\VimSetup\}

1. Install gvim73_46.exe [Let's say {C:\Program Files\Vim}]

2. Copy over the gvim.exe (which is a patched version including Ruby support) to {C:\Program Files\Vim}.

3. Install Ruby using rubyinstaller-1.9.1-p430.exe to {C:\Rub191\}

4. Install Dev Kit using DevKit-4.5.0-20100819-1536-sfx.exe {C:\Ruby191\DevKit}

5. Open Start -> All Programs -> Ruby 1.9.1 -> Start Command Prompt With Ruby using administrative rights.

6. Go to C:\Ruby191\DevKit

7. Execute [ruby dk.rb init]

8. Execute [ruby dk.rb install]

9. Execute [devkitvars.bat]

10. Keep the command prompt open, open Vim.

11. Open c:\VimSetup\software\command-t-1.3.1.vba

12. Enter [:so %]

13. Find out your home directory [echo $HOME Let's say it is {C:\Users\SolutionYogi\VimFiles}]

14. Go to C:\Users\SolutionYogi\VimFiles\ruby\command-t

15. Execute [ruby extconf.rb]
	You should see
	[
	Checking for ruby.h yes
	creating Makefile
	]
16. Execute [make]
	You should see something like
	[
gcc -I. -IC:/Ruby191/include/ruby-1.9.1/i386-mingw32 -I/C/Ruby191/include/ruby-1.9.1/ruby/backward -I/C/Ruby191/include/ruby-1.9.1 -I. -DHAVE_RUBY_H
  -O2 -g -Wall -Wno-parentheses   -std=c99 -Wall -Wextra -Wno-unused-parameter -o ext.o -c ext.c
gcc -I. -IC:/Ruby191/include/ruby-1.9.1/i386-mingw32 -I/C/Ruby191/include/ruby-1.9.1/ruby/backward -I/C/Ruby191/include/ruby-1.9.1 -I. -DHAVE_RUBY_H
  -O2 -g -Wall -Wno-parentheses   -std=c99 -Wall -Wextra -Wno-unused-parameter -o match.o -c match.c
gcc -I. -IC:/Ruby191/include/ruby-1.9.1/i386-mingw32 -I/C/Ruby191/include/ruby-1.9.1/ruby/backward -I/C/Ruby191/include/ruby-1.9.1 -I. -DHAVE_RUBY_H
  -O2 -g -Wall -Wno-parentheses   -std=c99 -Wall -Wextra -Wno-unused-parameter -o matcher.o -c matcher.c
gcc -shared -s -o ext.so ext.o match.o matcher.o -L. -LC:/Ruby191/lib -L.  -Wl,--enable-auto-image-base,--enable-auto-import   -lmsvcrt-ruby191  -lshe
ll32 -lws2_32
	]

16. Modify the _vimrc in C:\Program Files\VIm directory to read like this (assuming that this project is synced in C:\VimSetup folder.)

set nocompatible

set runtimepath+=c:\VimSetup

source c:\vimsetup\_vimrc
