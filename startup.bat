@ECHO OFF
taskkill /F /IM "HttpLD.exe" /T
taskkill /F /IM "NoiseMonitorWin.exe" /T

cd HTTPD
START HttpLD.exe
timeout /t 5
FOR /L %%i IN (1,1,100) DO (
  (TASKLIST | FIND /I "HttpLD.exe") && GOTO :startnext
  timeout /t 5
)
ECHO Timeout waiting for NoiseMontoringWin.exe to start
GOTO :EOF

:startnext
cd ..
NoiseMonitorWin.exe setting.txt
