@ECHO OFF
SET argOne=%1
IF "%argOne%" =="-help" (
	ECHO usage: "AndroidScreengrab fileName filePathToSaveTo" 
	ECHO If no flags will save as grab_<current_datetime>.png to current location
	PAUSE
	GOTO :end
)

IF "%argOne%" == ""	SET argOne=grab_%DATE:/=-%_%TIME::=-%

	
adb shell screencap -p /sdcard/%argOne%.png
adb pull /sdcard/%argOne%.png %2
adb shell rm /sdcard/%argOne%.png
:end