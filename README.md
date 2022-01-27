# sq_img
Simple shell script to square images using Imagemagick (`convert` for compatibility).

## Installation

Clone the repo and run `./setup.sh`:

~~~
git clone https://github.com/dch42/sq.git && cd sq && chmod +x ./setup.sh && ./setup.sh
~~~

`setup.sh` will create a personal binary directory at '/Users/$USER/bin' (if it doesn't already exist) and add it to PATH. It will copy the script there after adding executible permissions.

## Usage
~~~
Usage: sq [-hfsct] 

  -h  help, show usage info
  -f  files to operate on (default '*.jpg')
  -s  set size in pixels (default 1000)
  -c  set background color (default white)
  -t  trim images before resizing

Example: sq -f 133*.jpg -t -c yellow -s 777
~~~

Trimming images with `-t` is useful when uniform padding is desired but source images have inconsistent whitespace.