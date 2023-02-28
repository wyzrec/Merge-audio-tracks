@echo off

if [%1]==[] goto usage
setlocal enabledelayedexpansion

set input=%~f1
set input_no_ext=%~dpn1
set output=%input_no_ext%.aac

ffmpeg -i "%input%" -filter_complex "[0:a:0][0:a:1]amix=inputs=2:duration=longest[a]" -map "[a]" "%output%"
goto end

:usage
echo 将视频文件拖到该脚本上
goto end

:end
pause