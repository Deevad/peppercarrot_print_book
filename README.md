**IMPORTANT**  
_Repository Archived:_ we continue here now: https://framagit.org/peppercarrot  
We moved on November 2017 to this new platform. Details [here](https://www.peppercarrot.com/en/article429/mega-maintenance). The current repository will be removed in 2018

---


# Printing book 1

STATUS: needs printer info (ISBN?colorprofile) + proofread texts.

![alt tag](http://www.peppercarrot.com/extras/forum/2017-03-23_screenshot_182109_net.jpg)

This repository was created to host the desktop-publishing source of the open-source first book of [Pepper&Carrot](http://www.peppercarrot.com) comic.

## Changelog :

* **2017-11-06**: Re-structure to allow translations in multiple languages.
* **2017-06-09**: Prefinal: All header, footer, gallery, colophon, frontpage, shrink from 80 pages to 68 pages, no need 'Inside' anymore.
* **2017-06-08**: Split gfx and text: more flexibility for cleaning pages footer and adding headers.
* **2017-03-23**: Better cover, add fonts. [screenshot](http://www.peppercarrot.com/extras/forum/2017-03-23_screenshot_182109_net.jpg)
* **2016-09-05**: Initial squeletton. [screenshot](http://www.peppercarrot.com/extras/forum/2016-09-05_desktop-publishing_scribus-step1.jpg)

## Install

You'll need :
* **A font pack** : the official Pepper&Carrot open fonts [here](https://github.com/Deevad/peppercarrot_fonts).
* **Scribus 1.5.4** : to edit the ```*.sla``` files. On 'buntu 16.04, [this PPA](https://launchpad.net/~scribus/+archive/ubuntu/ppa).
* **Krita 3.x** : to edit the ```*.kra``` files. on 'buntu 16.04, recent Appimage works perfectly.
* **The comic pages** :
	* You can download them [here](http://www.peppercarrot.com/en/static6/sources&page=download), and then extract them into the ```pages``` folder.
	* You can also execute ```getPages.bash en``` (where *en* is the language you want) to get them or update them automatically.
	* You can initialise a new translation by executing ```initLang.bash fr``` (where *fr* is the new language you want)

## Usage

* ```/``` Contains scripts and this README.
* ```/img``` Contains original graphics made for the book. Krita files, or PNG files.
* ```/lang/xx/``` Contains the different translations
	* ```/``` Contains Scribus ```*.sla``` files
	* ```/pages``` Contains the comic page sources (not delivered via git, see **Install**).

## License:

Based on the webcomic [Pepper&Carrot](https://www.peppercarrot.com) by David Revoy, 
licensed under the [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

Based on the universe of [Hereva](https://www.peppercarrot.com/static8/wiki) created by David Revoy with contributions by Craig Maloney. Corrections by Willem Sonke, Moini, Hali, CGand and Alex Gryson.

Authors of all modifications, corrections or contributions to this project accepts to release their work under the license: [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).
