cls

@echo off
cd execs
del *.exe
cd ..
cd routines
cobc -x -free -I C:\Users\vinic\Documents\Vinicius\COBOL\gnu\books characteres.cob -o C:\Users\vinic\Documents\Vinicius\COBOL\gnu\execs\characteres.exe
cd ..
cd pages
cd login
cobc -x -free -I C:\Users\vinic\Documents\Vinicius\COBOL\gnu\books login.cob -o C:\Users\vinic\Documents\Vinicius\COBOL\gnu\execs\login.exe
cobc -x -free -I C:\Users\vinic\Documents\Vinicius\COBOL\gnu\books login_submit.cob ..\..\routines\characteres.cob -o C:\Users\vinic\Documents\Vinicius\COBOL\gnu\execs\login_submit.exe
cd ..
cd members
cobc -x -free -I C:\Users\vinic\Documents\Vinicius\COBOL\gnu\books members.cob -o C:\Users\vinic\Documents\Vinicius\COBOL\gnu\execs\members.exe
cobc -x -free -I C:\Users\vinic\Documents\Vinicius\COBOL\gnu\books members_submit.cob ..\..\routines\characteres.cob -o C:\Users\vinic\Documents\Vinicius\COBOL\gnu\execs\members_submit.exe
cobc -x -free -I C:\Users\vinic\Documents\Vinicius\COBOL\gnu\books editmember.cob ..\..\routines\characteres.cob -o C:\Users\vinic\Documents\Vinicius\COBOL\gnu\execs\editmember.exe
cobc -x -free -I C:\Users\vinic\Documents\Vinicius\COBOL\gnu\books editmember_submit.cob ..\..\routines\characteres.cob -o C:\Users\vinic\Documents\Vinicius\COBOL\gnu\execs\editmember_submit.exe
cd ..
cd home
cobc -x -free -I C:\Users\vinic\Documents\Vinicius\COBOL\gnu\books home.cob -o C:\Users\vinic\Documents\Vinicius\COBOL\gnu\execs\home.exe
cd ..
cd ..
cd execs
@echo on
copy *.exe c:\Apache24\cgi-bin\gnu\ /Y
@echo off
cd ..


