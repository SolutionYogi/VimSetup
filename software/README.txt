Command-T installation Instructions for Vim 7.3 and Windows 7

Important Notes:

* You must follow instructions in this exact order. [E.g. Install Ruby First and then Vim]

* You must uninstall earlier version of Vim/Ruby

* If you don't trust the binaries in my repo, feel free to get them from the official sites. Make sure to get the exact version.

* All the paths within {} brackets may need to be adjusted based on your setup.

1. Clone this VimSetup repository in {C:\VimSetup\}

2. Install Ruby using rubyinstaller-1.9.1-p430.exe to {C:\Rub191\}

3. Install Dev Kit using DevKit-4.5.0-20100819-1536-sfx.exe {C:\Ruby191\DevKit}

4. Install gvim73_46.exe [Let's say {C:\Program Files\Vim\vim73}]

5. Copy over the gvim.exe (which is a patched version including Ruby support) to {C:\Program Files\Vim}. 
   This patched Vim was obtained from: http://wyw.dcweb.cn/

8. Open Start -> All Programs -> Ruby 1.9.1 -> Start Command Prompt With Ruby using administrative rights.

7. Go to C:\Ruby191\DevKit

8. Execute [ruby dk.rb init]
	You should see 

	[INFO] found RubyInstaller v1.9.1 at C:/Ruby191

	Initialization complete! Please review and modify the auto-generated
	'config.yml' file to ensure it contains the root directories to all
	of the installed Rubies you want enhanced by the DevKit.

9. Execute [ruby dk.rb install]
	
	You should see

	[INFO] Installing C:/Ruby191/lib/ruby/site_ruby/1.9.1/rubygems/defaults/operating_system.rb
	[INFO] Installing C:/Ruby191/lib/ruby/site_ruby/devkit.rb
	

10. Execute [devkitvars.bat]

	Adding the DevKit to PATH...

11. Keep this command prompt open and run gVim from Start -> All Programs -> Vim

	

12. Open c:\VimSetup\software\command-t-1.3.1.vba in Vim.

13. Enter [:so %]

14. Find out your home directory [echo $HOME Let's say it is {C:\Users\SolutionYogi\VimFiles}]

	[Make sure that the 'VimFiles' folder has following items:
		1. ruby -> command-t
			It should have total of 33 files in 3 folders. 
			If it does not, it means that vimball failed due to some reason. [I have it happen on certain machine.]
			In that case, go to {C:\VimSetup\software\command-t\ruby\command-t} and copy it over to your VimFiles folder.
		2. plugin/commant-t.vim
	]


15. Go to {C:\Users\SolutionYogi\VimFiles\ruby\command-t}

16. Execute [ruby extconf.rb]
	You should see
	[
	Checking for ruby.h yes
	creating Makefile
	]
17. Execute [make]
	You should see something like
	[
		gcc -I. -IC:/Ruby191/include/ruby-1.9.1/i386-mingw32 -I/C/Ruby191/include/ruby-1.9.1/ruby/backward -I/C/Ruby191/include/ruby-1.9.1 -I. -DHAVE_RUBY_H  -O2 -g -Wall -Wno-parentheses   -std=c99 -Wall -Wextra -Wno-unused-parameter -o ext.o -c ext.c
		gcc -I. -IC:/Ruby191/include/ruby-1.9.1/i386-mingw32 -I/C/Ruby191/include/ruby-1.9.1/ruby/backward -I/C/Ruby191/include/ruby-1.9.1 -I. -DHAVE_RUBY_H  -O2 -g -Wall -Wno-parentheses   -std=c99 -Wall -Wextra -Wno-unused-parameter -o match.o -c match.c
		gcc -I. -IC:/Ruby191/include/ruby-1.9.1/i386-mingw32 -I/C/Ruby191/include/ruby-1.9.1/ruby/backward -I/C/Ruby191/include/ruby-1.9.1 -I. -DHAVE_RUBY_H  -O2 -g -Wall -Wno-parentheses   -std=c99 -Wall -Wextra -Wno-unused-parameter -o matcher.o -c matcher.c
		gcc -shared -s -o ext.so ext.o match.o matcher.o -L. -LC:/Ruby191/lib -L.  -Wl,--enable-auto-image-base,--enable-auto-import   -lmsvcrt-ruby191  -lshe ll32 -lws2_32
	]

18. That's it, close and re-open Vim and Command-T should be working. Happy Coding! 