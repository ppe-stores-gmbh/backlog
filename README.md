# backlog Skript


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

### Was macht dieses Skript?
Dies ist ein BacklogSkript, welches für eine wesentlich schnellere Abarbeitung des Backlogs sorgt und dabei das PSC7 Plugin unterstüztzt. Dabei wird in dem Skript geschaut, wie viele Einträge es in der Backlog-Tabelle gibt, welche es abzuarbeiten gibt, damit zum Beispiel Bestellungen übertragen werden und lässt diese dann abarbeiten.
Zusätzlich wird noch ein Cronjob eingerichtet, welcher dafür sorgt, dass das Backlog schnell abgearbeitet werden kann. Wir empfehlen es in einem relativen kleinen Zeitintervall aufrufen zu lassen.

### Installation

Kopieren Sie sich die beiden Dateien backlog.sh und backlog.log und legen Sie diese in Ihr Shopware Hauptverzeichnis.
```sh
$ cd /pfad/zum/shopware-verzeichnis/
```

Einrichtung des Cronjobs auf dem Apache Server:

```sh
cd /etc
sudo crontab -e
```

Nach der erfolgreichen Authentifizierung können Sie nun die Cronjobs bearbeiten und wie in unserem Fall, können Sie nun den neun Cronjob anlegen:

```sh
*/30 * * * * cd /pfad/zum/shopware-verzeichnis/ && ./backlog.sh >> backlog.log
```

### Weitere Infos zum einrichten des Cronjobs:

Um den Intervall der Ausführung anzupassen, können Sie folgendes als Hilfestellung nutzen:
```sh
*     *     *     *     *  Befehl der ausgeführt werden soll
-     -     -     -     -
|     |     |     |     |
|     |     |     |     +----- Wochentag (0 - 7) (Sonntag ist 0 und 7; oder Namen, siehe unten)
|     |     |     +------- Monat (1 - 12)
|     |     +--------- Tag (1 - 31)
|     +----------- Stunde (0 - 23)
+------------- Minute (0 - 59; oder Namen, siehe unten)

```
Weitere Infos zu Cronjobs finden Sie unter: https://wiki.ubuntuusers.de/Cron/ 


