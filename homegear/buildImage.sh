#/bin/sh
docker build --no-cache -t psycho0verload/armv7hf-lib:homegear .
docker tag psycho0verload/armv7hf-lib:homegear psycho0verload/armv7hf-lib:homegear-latest
docker pull psycho0verload/armv7hf-lib:homegear
docker pull psycho0verload/armv7hf-lib:homegear-latest
