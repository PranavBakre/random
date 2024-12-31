cd "$1"
for file in *.mp4
do
    echo $file
    mkdir -p "${file%.*}"
    ffmpeg -i "$file" -codec: copy -start_number 0 -hls_time 10 -hls_list_size 0 -f hls "${file%.*}/${file%.*}.m3u8"
done
cd ..