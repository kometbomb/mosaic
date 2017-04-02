# mosaic

Script for combining four anim GIFs into one 2x2 mosaic. Made for tweeting nice combined screenshots of your PICO-8 projects.

The script assumes the input files are 256x256 animated GIFs of the same duration (this is the default in PICO-8). Please edit the script in case you want different dimensions.

You need to have [Imagemagick](http://www.imagemagick.org/script/download.php) installed!

## Example

 1. Save four GIFs in PICO-8 by pressing F9.
 2. You can rename the saved GIFs as something like 1.gif, 2.gif etc.
 3. Run mosaic.bat or mosaic.sh with the GIFs as input parameters as follows:
    `mosaic.bat 1.gif 2.gif 3.gif 4.gif output.gif`
	(the input files go from top left to bottom right)
 4. The script runs for a while and outputs the mosaic in a bit.
 5. Tweet the GIF and you will get tons of retweets.
