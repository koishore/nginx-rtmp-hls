# nginx-rtmp-hls module [WIP]

This module aims to run a HLS server and stream audio/ video to the localhost. To stream custom content, replace the 'example-vid.mp4' with your preferred file and modify the start.sh file and mention the filename there.

## Dependencies
- [nginx-rtmp-module](https://github.com/sergey-dryabzhinsky/nginx-rtmp-module.git)
- [nginx 1.17.0](http://nginx.org/download/nginx-1.17.0.tar.gz)
- [Docker 2.2.0.5](https://www.docker.com/products/docker-desktop)

## Execution Instructions
- Navigate to the `nginx-rtmp-hls` folder.
- Run the command: `sudo docker build --no-cache -t hls:1.0 .`
- Your docker image will built with all dependencies installed.
- Next, run the following command to stream audio/ video to your localhost: `sudo docker run hls:1.0`
- Your preferred media content will be streaming at `http://localhost:8080/hls/stream.m3u8`.
