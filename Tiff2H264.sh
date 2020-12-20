# Tif sequence / Nbr with 8 decimal / to H264 / with sound / 25fps
ffmpeg -r 25 -i Image_%08d.tif -i "Sound.aif" -c:v libx264 -c:a aac -pix_fmt yuv420p -r 25 -shortest -y Ouput.mp4
