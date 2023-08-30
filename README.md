# Papirus Folders

papirus-folders is a bash script that allows changing the color of folders in [Papirus icon theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) and its forks (which based on version 20171007 and newer).

## Table of contents

- [Preview](#preview)
- [Installation](#installation)
    - [Ubuntu and derivatives](#ubuntu-and-derivatives)
    - [Papirus Installer](#papirus-installer)
    - [Third-party packages](#third-party-packages)
- [Script usage](#script-usage)
- [Related projects](#related-projects)
- [Donate](#donate)

## Preview

| Name | Preview | Name | Preview |
|:-----|:-------:|:-----|:-------:|
| **adwaita** | ![folder-adwaita](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-adwaita.svg) ![user-adwaita-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-adwaita-home.svg) ![folder-adwaita-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-adwaita-download.svg) | **black** | ![folder-black](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-black.svg) ![user-black-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-black-home.svg) ![folder-black-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-black-download.svg) |
| **blue** | ![folder-blue](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-blue.svg) ![user-blue-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-blue-home.svg) ![folder-blue-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-blue-download.svg) | **bluegrey** | ![folder-bluegrey](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-bluegrey.svg) ![user-bluegrey-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-bluegrey-home.svg) ![folder-bluegrey-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-bluegrey-download.svg) |
| **breeze** | ![folder-breeze](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-breeze.svg) ![user-breeze-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-breeze-home.svg) ![folder-breeze-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-breeze-download.svg) | **brown** | ![folder-brown](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-brown.svg) ![user-brown-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-brown-home.svg) ![folder-brown-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-brown-download.svg) |
| **carmine** | ![folder-carmine](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-carmine.svg) ![user-carmine-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-carmine-home.svg) ![folder-carmine-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-carmine-download.svg) | **cyan** | ![folder-cyan](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-cyan.svg) ![user-cyan-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-cyan-home.svg) ![folder-cyan-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-cyan-download.svg) |
| **darkcyan** | ![folder-darkcyan](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-darkcyan.svg) ![user-darkcyan-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-darkcyan-home.svg) ![folder-darkcyan-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-darkcyan-download.svg) | **deeporange** | ![folder-deeporange](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-deeporange.svg) ![user-deeporange-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-deeporange-home.svg) ![folder-deeporange-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-deeporange-download.svg) |
| **green** | ![folder-green](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-green.svg) ![user-green-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-green-home.svg) ![folder-green-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-green-download.svg) | **grey** | ![folder-grey](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-grey.svg) ![user-grey-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-grey-home.svg) ![folder-grey-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-grey-download.svg) |
| **indigo** | ![folder-indigo](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-indigo.svg) ![user-indigo-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-indigo-home.svg) ![folder-indigo-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-indigo-download.svg) | **magenta** | ![folder-magenta](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-magenta.svg) ![user-magenta-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-magenta-home.svg) ![folder-magenta-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-magenta-download.svg) |
| **nordic** | ![folder-nordic](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-nordic.svg) ![user-nordic-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-nordic-home.svg) ![folder-nordic-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-nordic-download.svg) | **orange** | ![folder-orange](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-orange.svg) ![user-orange-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-orange-home.svg) ![folder-orange-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-orange-download.svg) |
| **palebrown** | ![folder-palebrown](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-palebrown.svg) ![user-palebrown-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-palebrown-home.svg) ![folder-palebrown-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-palebrown-download.svg) | **paleorange** | ![folder-paleorange](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-paleorange.svg) ![user-paleorange-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-paleorange-home.svg) ![folder-paleorange-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-paleorange-download.svg) |
| **pink** | ![folder-pink](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-pink.svg) ![user-pink-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-pink-home.svg) ![folder-pink-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-pink-download.svg) | **red** | ![folder-red](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-red.svg) ![user-red-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-red-home.svg) ![folder-red-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-red-download.svg) |
| **teal** | ![folder-teal](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-teal.svg) ![user-teal-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-teal-home.svg) ![folder-teal-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-teal-download.svg) | **violet** | ![folder-violet](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-violet.svg) ![user-violet-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-violet-home.svg) ![folder-violet-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-violet-download.svg) |
| **white** | ![folder-white](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-white.svg) ![user-white-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-white-home.svg) ![folder-white-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-white-download.svg) | **yaru** | ![folder-yaru](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-yaru.svg) ![user-yaru-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-yaru-home.svg) ![folder-yaru-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-yaru-download.svg) |
| **yellow** | ![folder-yellow](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-yellow.svg) ![user-yellow-home](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/user-yellow-home.svg) ![folder-yellow-download](https://cdn.jsdelivr.net/gh/PapirusDevelopmentTeam/papirus-icon-theme@master/Papirus/48x48/places/folder-yellow-download.svg) |

**NOTE:** This project doesn't provide any folder icons. If you want to request a new folder icon or a new color of folder please open an issue [here](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/issues/new).

## Installation

### Ubuntu and derivatives

You can install papirus-folders from our official [PPA](https://launchpad.net/~papirus/+archive/ubuntu/papirus):

```
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-folders
```

or download .deb packages from [here](https://launchpad.net/~papirus/+archive/ubuntu/papirus/+packages?field.name_filter=papirus-folders).

### Papirus Installer

Use the script to install the latest version directly from this repo (independently on your distro):

#### Install

```
wget -qO- https://git.io/papirus-folders-install | sh
```

To install papirus-folders to **home directory** using the following command:

```
wget -qO- https://git.io/papirus-folders-install | env PREFIX=$HOME/.local sh
```

To install papirus-folders on **BSD systems** using the following command:

```
wget -qO- https://git.io/papirus-folders-install | env PREFIX=/usr/local sh
```

#### Uninstall

```
wget -qO- https://git.io/papirus-folders-install | env uninstall=true sh
```

### Third-party packages

Packages listed in this section are third-party packages. If you have a problem or a question, please contact the package maintainer.

Please note that some packages in the list may be outdated, open [Repology](https://repology.org/project/papirus-folders/versions) to find out package versions.

| **Distro** |  **Maintainer**   | **Package**  |
| :--------- | :---------------- | :----------- |
| Arch Linux | Piotr Górski      | [papirus-folders-git](https://aur.archlinux.org/packages/papirus-folders-git) <sup>AUR</sup> |
| MX Linux   | Steven Pusser     | `sudo apt-get install papirus-folders` |
| NetBSD     | Nia Alarie        | [papirus-folders](http://pkgsrc.se/graphics/papirus-folders) <sup>pkgsrc</sup> |
| NixOS      | Alexandre Acebedo | `nix-env -iA nixos.papirus-folders` |
| openSUSE   | andy great     | [papirus-folders](https://software.opensuse.org/package/papirus-folders) <sup>OBS [[link](https://build.opensuse.org/package/show/openSUSE:Factory/papirus-folders)]</sub> |
| Void Linux | Benjamín Albiñana | `sudo xbps-install -S papirus-folders` |


**NOTE:** If you are a maintainer and want to be in the list, please create an issue or make a pull request.

### Script usage

Papirus-folders doesn't have a GUI, but it is a fully functional command-line application with TAB-completions. Below you'll see some examples of use.

#### Show the current color and available colors for Papirus-Dark

```
papirus-folders -l --theme Papirus-Dark
```

#### Change color of folders to brown for Papirus-Dark

```
papirus-folders -C brown --theme Papirus-Dark
```

#### Revert to default color of folders for Papirus-Dark

```
papirus-folders -D --theme Papirus-Dark
```

#### Restore the last used color from a config file

```
papirus-folders -Ru
```

The last command is extremely useful for restoring color after icon theme upgrade (official installers of [papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) and some third-party packages do this automatically).


## Related projects

Use case | Tool
--- | ---
Graphical user interface for papirus-folders | [papirus-folders-gui](https://github.com/ItzSelenux/papirus-folders-gui)
Graphical application for generating folders icon with to your own colors or with presets for popular themes | [Oomox theme designer](https://github.com/themix-project/oomox)
A context menu for Nautilus, Nemo or Caja File Browser for changing the color of an individual folder | [Folder Color](http://foldercolor.tuxfamily.org)
Dolphin contextual menu for coloring a selected folders | [Dolphin Folder Color](https://github.com/audoban/dolphin-folder-color)

## Donate

If you would like to support development by making one-time donation or by becoming a supporter, please visit our page on [Buy Me a Coffee](https://www.buymeacoffee.com/papirus) and [Liberapay](https://liberapay.com/Papirus).

<a href="https://liberapay.com/Papirus/donate"><img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg"></a>

<a href="https://www.buymeacoffee.com/papirus"><img alt="Buy me a coffee" src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=papirus&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff" /></a>
