Ceci est le futur/nouveau site du [PLUG](http://plugfr.org/)

Il utilise [Jekyll](http://jekyllrb.com) pour être "compilé" en un ensemble de fichiers statiques que l'on peut héberger facilement

Le contenu est importé depuis l'ancien site sous SPIP, exporté en XML via phpMyAdmin. Le fichier est dans `./script/spip_articles.xml`
Le script Ruby ayant servi à parser l'export XML (issu de phpMyAdmin) se trouve dans `./script/migration_plug.rb`
Les fichiers générés par ce script ont été passablement modifiés à la main après coup, mais il peut avoir une valeur pédagogique.

Certains contenus (images, pdf, …) ont été copiés dans le dossier `./pub` pour pouvoir être reliés aux articles. Ça n'est pas exhaustif.

[Pygments](http://pygments.org/) est utilisé pour colorer le code source.
Il y a de nombreux styles CSS dans `./css/pygments`, j'ai laissé celui par défaut pour le moment.

* * *

HowTo contribuer au site
========================

* git clone git://github.com/plug/plugfr.org.git
* Hack … hack … commit …
* git format-patch … à envoyer webmaster@plugfr.org

Note : il est possible aussi de soumettre ses modifications via une nouvelle branche Git

Si l'on est contributeur régulier, on obtiendra les droits
de commit sur le repository GitHub, puis :

* git clone git@github.com:plug/plugfr.org.git
* Hack … hack … commit …
* git push
* Attendre la mise en ligne des modifications par un webmaster

Pour faciliter l'installation des librairies Ruby nécessaire à la génération du site, il est possible d'utiliser [Bundler](http://gembundler.com).

    $ gem install bundler
    $ bundle

Et en cas de version multiples, … pour être sûr d'utiliser la version spécifiée dans le `Gemfile` : `$ bin/jekyll [options]`.

