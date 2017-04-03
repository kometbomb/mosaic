@echo off

rem Check for the correct amount of arguments (5)

if %5.==. goto usage

rem Check that Imagemagick is available

magick 1> nul 2> nul
if "%errorlevel%" == "9009" goto dependencies

rem Create the montage

echo [1/3] Creating top row...
magick convert "%1" -repage 512x256 -coalesce null: ( "%2" -coalesce ) -geometry +256+0 -layers Composite temp_top.gif
echo [2/3] Creating bottom row...
magick convert "%3" -repage 512x256 -coalesce null: ( "%4" -coalesce ) -geometry +256+0 -layers Composite temp_bottom.gif
echo [3/3] Creating final image...
magick convert temp_top.gif -repage 512x512 -coalesce null: ( temp_bottom.gif -coalesce ) -geometry +0+256 -layers Composite "%5"
echo Cleaning up...
del temp_top.gif
del temp_bottom.gif
echo Done!
goto quit

:usage
echo USAGE: montage.bat top-left-filename top-right-filename bottom-left-filename bottom-right-filename output-filename
echo ""
echo This script combines four input images (animated gifs) into a single 2x2 mosaic.
echo The script assumes the input files are 256x256.
goto quit
:dependencies
echo ERROR: You need to install the Imagemagick command line tools to use this script.
goto quit
:quit
