# Overview - Graylog 6 Docker Compose

This is a slightly modified version of the one proposed by Tom Lawrence.

[Github Lawrence Systems](https://github.com/lawrencesystems/graylog)


This repository allows installing Graylog V6 using bind mounts instead of the local driver. To achieve this, the volume dedicated to Graylog data must have an owner different from the default.


# Usage

```
git clone -b graylog6 https://github.com/d3zit/graylog.git
cd graylog
chmod +x run.sh
./run.sh

```

Access graylog [here.](http://localhost:9000)

nxlog.conf is the Window NXLOG configuration for sending GELF format logs to Graylog. Replace the default C:\Program Files\nxlog\conf\nxlog.conf with the one https://raw.githubusercontent.com/lawrencesystems/graylog/master/nxlog.conf and change the IP address to match your Graylog server.
