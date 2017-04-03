MAGICK_CONVERT="magick convert"

usage ()
{
  echo 'Usage : mosaic.sh <top-left-filename> <top-left-filename> <top-left-filename> <top-left-filename> <output-filename>'
  echo ''
  echo 'This script combines four input images (animated gifs) into a single 2x2 mosaic.'
  echo 'The script assumes the input files are 256x256.'
  exit
}

if [ "$#" -ne 5 ]
then
  usage
fi

command -v magick >/dev/null 2>&1 || { echo "ERROR: You need to install the Imagemagick command line tools to use this script." >&2; exit 1; }

echo '[1/3] Creating top row...'
$MAGICK_CONVERT $1 -repage 512x256 -coalesce null: \( $2 -coalesce \) -geometry +256+0 -layers Composite temp_top.gif
echo '[2/3] Creating bottom row...'
$MAGICK_CONVERT $3 -repage 512x256 -coalesce null: \( $4 -coalesce \) -geometry +256+0 -layers Composite temp_bottom.gif
echo '[3/3] Creating final image...'
$MAGICK_CONVERT temp_top.gif -repage 512x512 -coalesce null: \( temp_bottom.gif -coalesce \) -geometry +0+256 -layers Composite $5
echo 'Cleaning up...'
rm temp_top.gif
rm temp_bottom.gif
echo 'Done!'

