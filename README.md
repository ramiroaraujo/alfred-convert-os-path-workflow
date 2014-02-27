# Convert OS Paths Workflow for Alfred app

Worflow for swithching back and forth between UNIX and Windows Paths, specifically between Mapped Drives and Mounted Network Volumes.
It features the actual switching of paths, optionally open the path in Finder, and configuration options to list, add and remove mappings between Windows drives and UNIX volumes.

## Setup
You'll need to add one or more mappings before doing the conversions. Check below on _usage_ for more info.

## Usage
* Type ```convertadd``` keyword to add a new mappping, for example ```convertadd R MyVolume```. This will map R:\ Windows Paths with /Volumes/MyVolume UNIX Paths. After ```convertadd``` you need to specify a Windows Drive letter, followed by a UNIX Volume name.

![add a mapping](https://raw.github.com/ramiroaraujo/alfred-convert-os-path-workflow/master/screenshots/convert-add.png)

* Type ```convertlist``` keyword to list current mappings. Hold down the ```alt``` key to delete a mapping.

![list mappings](https://raw.github.com/ramiroaraujo/alfred-convert-os-path-workflow/master/screenshots/convert-list.png)

* Type ```convert``` keyword followed by a valid and mapped Windows or UNIX path to have it converted and copied to the clipboard. Hold down ```Command``` to instead open the path in Finder if converting to UNIX.

![convert to UNIX](https://raw.github.com/ramiroaraujo/alfred-convert-os-path-workflow/master/screenshots/convert-to-unix.png)

![convert to Windows](https://raw.github.com/ramiroaraujo/alfred-convert-os-path-workflow/master/screenshots/convert-to-windows.png)


## Installation
For OS X 10.9 Mavericks, Download the [alfred-convert-os-path.alfredworkflow](https://github.com/ramiroaraujo/alfred-convert-os-path-workflow/raw/master/alfred-convert-os-path.alfredworkflow) and import to Alfred 2.

For Previous OS X Versions, Download the [alfred-convert-os-path.alfredworkflow](https://github.com/ramiroaraujo/alfred-convert-os-path-workflow/raw/pre-mavericks/alfred-convert-os-path.alfredworkflow) and import to Alfred 2.

## Changelog
* _2014-01-06_ - Released
