# annke-hikvision

using ffmpeg to watch streams from annke/hikvision cameras

```ffplay -rtsp_transport tcp rtsp://admin:$PASSWORD@192.168.1.23:554/Streaming/Channels/101```

ptz.sh - bash script for ptz controls. tested with annke zc400 surveillance pan tilt zoom camera.

run:


```bash ptz.sh```

and use arrow keys to move camera and + and - for a zoom
