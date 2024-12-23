mkdir ./conv
ls *.jpg | xargs -I{} convert {}  -quality 100 -resize 1280x -verbose ./conv/{}
ls *.JPG | xargs -I{} convert {}  -quality 100 -resize 1280x -verbose ./conv/{}
ls *.png | xargs -I{} convert {}  -quality 100 -resize 1280x -verbose ./conv/{}
ls *.PNG | xargs -I{} convert {}  -quality 100 -resize 1280x -verbose ./conv/{}

