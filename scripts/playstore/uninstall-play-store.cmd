
@echo off

color 0e


set adb="%~dp0bin\adb.exe"


set uninstall=%adb% uninstall



cls


%uninstall% com.android.vending





:end



