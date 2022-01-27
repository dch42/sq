#!/bin/sh

# set defaults
declare file_path="*.jpg"
declare size=1000
declare color="white"

function usage {
    echo "Square images using Imagemagick"
    printf "Usage: $(basename $0) [-hfsct] \n\n" 2>&1
    echo "  -h  help, show usage info"
    echo "  -f  files to operate on (default '*.jpg')"
    echo "  -s  set size in pixels (default 1000)"
    echo "  -c  set background color (default white)"
    echo "  -t  trim images before resizing"
    printf "\nExample: sq -f 133*.jpg -t -c yellow -s 777\n\n"
    exit 1
}

function square_images {
    convert $file_path -set filename:f "%[t]_sq" -background "${color}" -gravity center -resize ${size}x${size} -extent ${size}x${size} -quality 100 "%[filename:f].jpg"
}

while getopts hf:s:c:t arg; 
do
    case "${arg}" in
        h) usage ;;
        f) file_path=${OPTARG} ;;
        s) size=${OPTARG} ;;
        c) color=${OPTARG} ;;
        t) echo "Trimming $file_path..." && 
            $(mogrify -trim $file_path) ;;
        ?) echo "Invalid option: -${OPTARG}" && usage ;;
    esac
done

echo "Squaring $file_path..."
echo "Size: $size x $size"
echo "Background: $color"

square_images && echo "Done!" && exit 0 || exit 1
