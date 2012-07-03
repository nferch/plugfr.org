#!/usr/bin/env bash

set -e

rm -rf _site
mkdir _site

JEKYLL_OPTIONS='--no-auto'

if which bundle >/dev/null; then
  JEKYLL_BIN='bundle exec jekyll'
else
  JEKYLL_BIN='jekyll'
fi

$JEKYLL_BIN $JEKYLL_OPTIONS

if [ $? -eq 0 ]; then
  echo "Remove empty lines from generated files"
  ./script/remove_empty_lines.sh
fi

if [ $? -eq 0 ]; then
  SITEMAP=_site/sitemap.xml

  if [ -f $SITEMAP ]; then
    if [ -f $SITEMAP.gz ]; then
      rm $SITEMAP.gz
    fi
    gzip -c $SITEMAP > $SITEMAP.gz
  fi


  # Check if we have an access on remote server, so users without access can run this script without "real" error
  REMOTE=plug@ssh.tuxfamily.org
  ssh -q -o "BatchMode=yes" ${REMOTE} "echo 2>&1 >/dev/null"

  if [ $? -eq 0 ] ; then
    rsync -aH --exclude=.git --delete-excluded --delete _site/ ${REMOTE}:plugfr/plugfr.org-web/htdocs/

    if [ $? -eq 0 ]; then
      echo "Site uploaded to 'TuxFamily' : http://plugfr.org/"
    else
      echo "Rsync a retourné l'erreur $? lors de l'upload" 1>&2
    fi

  else
    echo "Vous n'avez pas d'accès sur le serveur distant, ou le serveur est injoignable" 1>&2
  fi

else
 echo "----" 1>&2
 echo "Impossible de re-générer le site Jekyll a retourné l'erreur $?" 1>&2
fi

