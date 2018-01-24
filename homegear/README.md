Personal Docker image of the official Homegear Docker image. It is based on Debian 9 (Stretch) and recreated with every new release.

# Supported Tags
homegear, homegear-latest
Configuration Files and Database
The following directories can be loaded from the host to keep the data and configuration files out of the container:

/etc/homegear
/var/lib/homegear
/var/log/homegear
# Usage
To run the stable version of Homegear, execute the following commands.

Create the data and log directories:

 mkdir -p /homegear-data/etc
 mkdir /homegear-data/lib
 mkdir /homegear-data/log
Start Homegear using those directories and exposing ports 2001 to 2003. The name of the container is set to homegear:

 docker run -d --rm -v /homegear-data/etc:/etc/homegear:Z -v /homegear-data/lib:/var/lib/homegear:Z -v /homegear-data/log:/var/log/homegear:Z -p 2001:2001 -p 2002:2002 -p 2003:2003 --name homegear homegear/homegear:stable
To enter Homegear's CLI execute:

 docker exec -it homegear homegear -r
To run a PHP command within Homegear's script engine, use:

 docker exec -it homegear homegear -e rc 'print $hg->getVersion();'
To execute a script in the scripts directory:

 docker exec -it homegear homegear -e rs MyScript.php
# Additional Options
If you want to expose host devices to Homegear use the --device option. E. g. to expose /dev/ttyUSB0:

docker run -d --rm -v /homegear-data/etc:/etc/homegear:Z -v /homegear-data/lib:/var/lib/homegear:Z -v /homegear-data/log:/var/log/homegear:Z -p 2001:2001 -p 2002:2002 -p 2003:2003 --device=/dev/ttyUSB0 --name homegear homegear/homegear:stable
