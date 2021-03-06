#!/bin/bash

set -e

[ "user" != "$USER" ] && exec sudo -u user $0 "$@"

DIR=/var/www/html/tutorial/
mkdir -p $DIR
sudo chown $USER $DIR
for md in /home/user/intelmq-tutorial/*.md; do
    out="${md%%.md}.html"
    out="${out##*/}"
    pandoc "$md" -f gfm -o "$DIR/$out"
done

cp -R /home/user/intelmq-tutorial/images/ /var/www/html/tutorial/
