#!/bin/bash

set -eu

echo 'Generate the documentation from the database schema'

java -jar schemaSpy_5.0.0.jar -dp postgresql-9.3-1101-jdbc41.jar -t pgsql -host localhost -db app -u app_adm -p app-adm -s public -o schemadocs 

echo 'siivotaan mainosbanneri häiritsemästä ja korjataan merkistöt utf-8 muotoon.'
cd schemadocs
touch null.js

# Recursively loop over all HTML files and fix encoding to UTF-8
find . -name "*.html" -type f |
  (while read file; do
    echo "found  $file"
    LC_CTYPE=C && cat $file |sed 's/http\:\/\/pagead2.googlesyndication.com\/pagead\/show_ads.js/null.js/g' > siivottu.html
    LC_CTYPE=C && cat siivottu.html | sed 's/<head>/<head><meta charset\=\"ISO-8859-1\" \/>/g' |
      sed 's/ISO-8859-1/UTF-8/g' > merkistokorjattu.html
    iconv -f ISO-8859-1 -t UTF-8 merkistokorjattu.html > $file
  done);
