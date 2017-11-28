# Papirus Folders

papirus-folders is a bash script that allows changing the color of folders in [Papirus icon theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) and Papirus' forks (which based on version 20171007 and newer).

At the moment papirus-folders doesn't have a GUI, but it is a fully functional command-line application.

Some examples of use:

- Show the current color and available colors for Papirus-Adapta:
    ```
    papirus-folders -l --theme Papirus-Adapta
    ```
- Change color of folders to brown for Papirus-Adapta:
    ```
    papirus-folders -C brown --theme Papirus-Adapta
    ```
- Revert to default color of folders for Papirus-Adapta:
    ```
    papirus-folders -D --theme Papirus-Adapta
    ```
- Restore the last used color from a config file:
    ```
    papirus-folders -R
    ```
    This is extremely useful for restoring color after icon theme upgrade (official installers of [papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) and some third-party packages do this automatically).

**NOTE:** To change the color of an individual folder you can use [Folder Color](http://foldercolor.tuxfamily.org) or [Dolphin Folder Color](https://github.com/audoban/dolphin-folder-color).

## Preview

| Name | Preview | Name | Preview |
|:-----|:-------:|:-----|:-------:|
| **black** | ![folder-black](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-black.svg) ![user-black-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-black-home.svg) ![folder-black-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-black-download.svg) | **blue** | ![folder-blue](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-blue.svg) ![user-blue-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-blue-home.svg) ![folder-blue-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-blue-download.svg) |
| **brown** | ![folder-brown](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-brown.svg) ![user-brown-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-brown-home.svg) ![folder-brown-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-brown-download.svg) | **cyan** | ![folder-cyan](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-cyan.svg) ![user-cyan-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-cyan-home.svg) ![folder-cyan-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-cyan-download.svg) |
| **green** | ![folder-green](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-green.svg) ![user-green-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-green-home.svg) ![folder-green-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-green-download.svg) | **grey** | ![folder-grey](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-grey.svg) ![user-grey-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-grey-home.svg) ![folder-grey-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-grey-download.svg) |
| **magenta** | ![folder-magenta](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-magenta.svg) ![user-magenta-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-magenta-home.svg) ![folder-magenta-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-magenta-download.svg) | **orange** | ![folder-orange](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-orange.svg) ![user-orange-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-orange-home.svg) ![folder-orange-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-orange-download.svg) |
| **red** | ![folder-red](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-red.svg) ![user-red-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-red-home.svg) ![folder-red-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-red-download.svg) | **teal** | ![folder-teal](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-teal.svg) ![user-teal-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-teal-home.svg) ![folder-teal-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-teal-download.svg) |
| **violet** | ![folder-violet](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-violet.svg) ![user-violet-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-violet-home.svg) ![folder-violet-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-violet-download.svg) | **yellow** | ![folder-yellow](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-yellow.svg) ![user-yellow-home](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/user-yellow-home.svg) ![folder-yellow-download](https://cdn.rawgit.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/places/folder-yellow-download.svg) |

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
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/install.sh | sh
```

To install papirus-folders on **BSD systems** using the following command:

```
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/install.sh | TAG=xBSD PREFIX=/usr/local sh
```

#### Uninstall

```
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/install.sh | uninstall=true sh
```

### Unofficial packages

Packages in this section are not part of the official repositories. If you have a problem or a question, please contact the package maintainer.

| **Distro** | **Maintainer**  | **Package**                              |
| :--------- | :-------------- | :--------------------------------------- |
| Arch Linux | Piotr Górski    | [papirus-folders-git](https://aur.archlinux.org/packages/papirus-folders-git/) <sup>AUR</sup> |

**NOTE:** If you are a maintainer and want to be in the list, please create an issue or make a pull request.
