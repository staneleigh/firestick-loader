@echo off

:reset

color 0e

set _color="%cd%\bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractZIP="%~dp0bin\unzip.exe" -o

set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="%~dp0bin\adb.exe"
set adbWait=%adb% wait-for-device

set appName=0
set choice=2

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set swipeUp=%shell% input swipe 200 900 200 300
set keyEnter=%shell% input keyevent 66
set keyTab=%shell% input keyevent 61


set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard



cls
echo Removing Amazon Update Services....
echo.
echo.

%shell% "su -c am kill com.amazon.dcp"
%shell% "su -c am kill com.amazon.device.software.ota"

%uninstall% com.amazon.dcp
%uninstall% com.amazon.device.software.ota

%shell% "su -c rm -rf /system/priv-app/DeviceSoftwareOTA"
%shell% "su -c rm -rf /system/priv-app/DeviceSoftwareOTAContracts"
%shell% "su -c rm -rf /system/priv-app/DeviceSoftwareOTAIdleOverride"

