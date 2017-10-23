#!/usr/bin/env zsh

echo "-- current file: `basename $0` --"

FILETYPE=""
if [ $# -gt 0 ]; then
    if [[ "$1" == "-t" ]];then
        FILETYPE="$2"
    else
        echo "Unrecognized option: $1"
        cat << EOF
Usage: $me [OPTIONS]

    Options:
    -t    Specify the file type mp4, mov.
    -f    Specify the file.
EOF
    exit 1
    fi

    if [[ "$3" == "-f" ]]; then
        CURRENTFILE=$4
        if [[ "$2" == "mov" ]]; then
            FILENAME=$4
            F=${FILENAME%%.*}.mp4
            CURRENTFILE=$F
            ffmpeg -i $4 -vcodec copy -acodec copy $F -y
        fi
        echo  "--  compress file: $4 --"
        ffmpeg -i $CURRENTFILE -vcodec h264 -acodec aac "${CURRENTFILE%%.*}-compress.mp4" -y

        echo  "--  removing oldfile: $4 --"
        rm -rf $CURRENTFILE

        echo  "--  scale to 1280x800: $4 --"
        ffmpeg -i "${CURRENTFILE%%.*}-compress.mp4" -vf scale=1280:800,setsar=1:1  "${CURRENTFILE%%.*}-low.mp4" -hide_banner -y

        echo  "--  scale to 640x400: $4 --"
        ffmpeg -i "${CURRENTFILE%%.*}-compress.mp4" -vf scale=640:400,setsar=1:1  "${CURRENTFILE%%.*}-lower.mp4" -hide_banner -y

        mv "${CURRENTFILE%%.*}-compress.mp4" "${CURRENTFILE%%.*}.mp4"
    else
    echo "Unrecognized option: $3"
        cat << EOF
Usage: $me [OPTIONS]

    Options:
    -f    Specify the file.
EOF
    exit 1
    fi
#ffmpeg -i $1 -vcodec h264 -acodec aac $1-compress.mp4
else
    echo "filename undefined"
    cat <<EOF
Usage: `basename $0` [OPTIONS]

       You must provide a file ex: -t mp4 -f my-video.mp4
                                   -t mov -f my-video.mov
EOF
    exit 1
fi

