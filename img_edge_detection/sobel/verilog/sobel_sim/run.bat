
%QUARTUS_ROOTDIR%\bin\quartus_sh -t run.tcl >log.txt
if ERRORLEVEL 1 goto continue
if ERRORLEVEL 0 goto eof
:continue
start /b notepad log.txt
type log.txt
ECHO run  failuare
goto tail
:eof
echo %errorlevel%
echo compile pass
start /b /min notepad log.txt
type log.txt
%QUARTUS_ROOTDIR%\bin\quartus_stp.exe -t prog.tcl
ECHO run successfully

:tail
ECHO run end
