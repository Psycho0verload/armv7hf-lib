# Homegear

Das ist eine Kopie von der offiziellen Homegear Docker Image. Basierend auf Debian 9 (Stretch)

## Unterstütze Tags

* *homegear, homegear-latest*

## Konfigurationsdateien und Datenbank
Folgende Ordner können vom Host geladen werden um die Konfigurationsdateien außerhalb vom Container zu speichern:

* */etc/homegear*
* */var/lib/homegear*
* */var/log/homegear*

## Verwendung

Um eine stabile Version von Homegear laufen zu lassen, führen wir folgende Befehle aus:

1. Erstellen der Daten- und Logordner:
```mkdir -p /homegear-data/etc```
```mkdir /homegear-data/lib```
```mkdir /homegear-data/log```
2. Start Homegear using those directories and exposing ports 2001 to 2003. The name of the container is set to homegear:
```docker run -d --rm -v /homegear-data/etc:/etc/homegear:Z -v /homegear-data/lib:/var/lib/homegear:Z -v /homegear-data/log:/var/log/homegear:Z -p 2001:2001 -p 2002:2002 -p 2003:2003 --name homegear psycho0verload/armv7hf-lib:homegear-latest```
3. To enter Homegear's CLI execute:
```docker exec -it homegear homegear -r```
To run a PHP command within Homegear's script engine, use:
```docker exec -it homegear homegear -e rc 'print $hg->getVersion();'```
To execute a script in the scripts directory:
```docker exec -it homegear homegear -e rs MyScript.php```

## Docker-Compose

Mein persönliches docker-compose.yml:

```
version: '2.2'
services:
  homegear:
    container_name: Homegear
    image: psycho0verload/armv7hf-lib:homegear-latest
    restart: always
    ports:
      - 2001-2003:2001-2003
    volumes:
      - /opt/Homegear/etc:/etc/homegear:Z
      - /opt/Homegear/lib:/var/lib/homegear:Z
      - /opt/Homegear/log:/var/log/homegear:Z
    devices:
      - /dev/ttyAMA0:/dev/ttyAMA0
```

## Additional Options

If you want to expose host devices to Homegear use the ```--device``` option. E. g. to expose ```/dev/ttyUSB0```:

```docker run -d --rm -v /homegear-data/etc:/etc/homegear:Z -v /homegear-data/lib:/var/lib/homegear:Z -v /homegear-data/log:/var/log/homegear:Z -p 2001:2001 -p 2002:2002 -p 2003:2003 --device=/dev/ttyUSB0 --name homegear psycho0verload/armv7hf-lib:homegear-latest```
