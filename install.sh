#!/bin/sh

find source -type f -name '*.m' | while read path; do 
    ln -sfn $path `basename $path`
done
