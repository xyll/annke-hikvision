# annke-hikvision

using ffmpeg to watch streams from annke/hikvision cameras

```ffplay -rtsp_transport tcp rtsp://admin:$PASSWORD@192.168.1.23:554/Streaming/Channels/101```

ptz.sh - bash script for ptz controls. tested with annke zc400 surveillance pan tilt zoom camera under linux.

Accordingly to https://www.youtube.com/watch?v=Ys6MCk46_kI annke zc400  is identical to Hikvision DS-2DE2A404IW-DE3

run:


```bash ptz.sh```

and use arrow keys to move camera and + and - for a zoom in active terminal window.
