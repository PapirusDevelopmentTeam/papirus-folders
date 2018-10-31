#!/usr/bin/env bash
# This script allows changing the color of folders in Papirus icon theme
#
# @author: Sergei Eremenko (https://github.com/SmartFinn)
# @license: MIT license (MIT)
# @link: https://github.com/PapirusDevelopmentTeam/papirus-folders

if test -z "$BASH_VERSION"; then
	printf "Error: this script only works in bash.\n" >&2
	exit 1
fi

if (( BASH_VERSINFO[0] * 10 + BASH_VERSINFO[1] < 40 )); then
	printf "Error: this script requires bash version >= 4.0\n" >&2
	exit 1
fi

# set -x  # Uncomment to debug this shell script
set -o errexit \
	-o noclobber \
	-o pipefail

readonly THIS_SCRIPT="$(readlink -f "${BASH_SOURCE[0]}")"
readonly PROGNAME="$(basename "${BASH_SOURCE[0]}")"
readonly VERSION="1.0.0"
readonly -a ARGS=("$@")

msg() {
	printf "%s: %b\n" "$PROGNAME" "$*" >&2
}

verbose() {
	[ "$VERBOSE" -eq 1 ] || return 0
	msg "$@"
}

err() {
	msg "Error:" "$@"
}

_exit() {
	msg "$@" "Exiting ..."
	exit 0
}

fatal() {
	err "$@"
	exit 1
}

usage() {
	cat >&2 <<- EOF
	usage:
	 $PROGNAME [options] -t <theme> {-C --color} <color>
	 $PROGNAME [options] -t <theme> {-D --default}
	 $PROGNAME [options] -t <theme> {-R --restore}

	OPERATIONS:
	 -C --color <color>  change color of folders
	 -D --default        back to the default color
	 -R --restore        restore the last used color from the config file

	OPTIONS:
	 -l --list           show available colors
	 -t --theme <theme>  make changes to the specified theme instead of Papirus
	 -u --update-caches  update icon caches for Papirus and siblings
	 -V --version        print $PROGNAME version and exit
	 -v --verbose        be verbose
	 -h --help           show this help
	EOF

	exit "${1:-0}"
}

_is_root_user() {
	if [ "$(id -u)" -eq 0 ]; then
		return 0
	fi

	return 1
}

_is_user_dir() {
	[ -n "$HOME" ] || return 1

	# if $THEME_DIR is placed in home dir
	if [ -z "${THEME_DIR##"$HOME"/*}" ]; then
		return 0
	fi

	return 1
}

_is_valid_color() {
	local color="$1"

	eval "$(declare_colors)"

	for i in "${colors[@]}"; do
		[ "$i" == "$color" ] || continue
		return 0
	done

	return 1
}

declare_colors() {
	local color=''
	local -a colors=()
	local -a valid_colors=("black" "blue" "bluegrey" "brown" "cyan"
		"green" "grey" "magenta" "orange" "pink" "purple" "red"
		"teal" "violet" "yellow")

	for color in "${valid_colors[@]}"; do
		if [ -e "$THEME_DIR/48x48/places/folder-$color.svg" ]; then
			colors=( "${colors[@]}" "$color" )
		fi
	done

	# return array of colors
	declare -p colors
}

declare_current_color() {
	local icon_file icon_name current_color=''

	icon_file=$(readlink -f "$THEME_DIR/48x48/places/folder.svg")
	icon_name=$(basename "$icon_file" .svg)
	current_color="${icon_name##*-}"

	declare -p current_color
}

get_theme_dir() {
	local data_dir icons_dir
	local -a data_dirs=()
	local -a icons_dirs=(
		"$HOME/.icons"
		"${XDG_DATA_HOME:-$HOME/.local/share}/icons"
	)

	# Get data directories from XDG_DATA_DIRS variable and
	# convert colon-separated list into bash array
	IFS=: read -ra data_dirs <<< "${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

	for data_dir in "${data_dirs[@]}"; do
		[ -d "$data_dir/icons" ] || continue
		icons_dirs=( "${icons_dirs[@]}" "${data_dir%/}/icons" )
	done

	for icons_dir in "${icons_dirs[@]}"; do
		[ -f "$icons_dir/$THEME_NAME/index.theme" ] || continue
		printf '%s' "$icons_dir/$THEME_NAME"
		verbose "'$THEME_NAME' is found in '$icons_dir'."
		return 0
	done

	return 1
}

get_user() {
	local user=''

	if [ -n "$PKEXEC_UID" ]; then
		user="$(id -nu "$PKEXEC_UID")"
	elif [ -n "$SUDO_USER" ]; then
		user="$SUDO_USER"
	elif [ -n "$LOGNAME" ]; then
		user="$LOGNAME"
	else
		user="$(id -nu)"
	fi

	printf '%s' "$user"
}

get_user_home() {
	local user

	user="$(get_user)"

	getent passwd "$user" | awk -F: '{print $(NF-1)}'
}

config() {
	# usage: config [{-n --new}] {-s --set} key=value... | {-g --get} key...
	local config_dir
	local config_file

	if _is_user_dir; then
		config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/$PROGNAME"
	else
		config_dir="/var/lib/$PROGNAME"
	fi

	config_file="$config_dir/keep"

	while (( "$#" )); do
		case "$1" in
			-g|--get) shift;
				[ -f "$config_file" ] || return 1

				for key; do
					[ -n "$key" ] || continue
					awk -F= -v key="$key" '
					$1 == key {
						print $2
						exit
					}
					' "$config_file"
				done

				break
				;;
			-n|--new) shift;
				rm -f "$config_file"
				;;
			-e|--exists) shift;
				# return 1 if test config_file not exist or empty
				if [ -f "$config_file" ] && [ -s "$config_file" ]; then
					return 0
				else
					return 1
				fi
				;;
			-s|--set) shift;
				[ -d "$config_dir"  ] || mkdir -p "$config_dir"
				[ -f "$config_file" ] || touch "$config_file"

				verbose "Saving params to '$config_file' ..."
				cat >> "$config_file" <<- EOF
				$(for key_value; do echo "$key_value"; done)
				EOF

				break
				;;
			*)
				err "illegal option -- '$1'"
				return 1
		esac
	done

	return 0
}

change_color() {
	local color="${1:?${FUNCNAME[-1]}: color is not set}"
	local size prefix file_path file_name symlink_path
	local -a sizes=(22x22 24x24 32x32 48x48 64x64)
	local -a prefixes=("folder-$color" "user-$color")

	for size in "${sizes[@]}"; do
		for prefix in "${prefixes[@]}"; do
			for file_path in "$THEME_DIR/$size/places/$prefix"{-*,}.svg; do
				[ -f "$file_path" ] || continue  # is a file
				[ -L "$file_path" ] && continue  # is not a symlink

				file_name="${file_path##*/}"
				symlink_path="${file_path/-$color/}"  # remove color suffix

				ln -sf "$file_name" "$symlink_path" \
					|| fatal "Fail to create '$symlink_path' symlink"
			done
		done
	done
}

list_colors() {
	local color='' prefix=''

	eval "$(declare_colors)"
	eval "$(declare_current_color)"

	for color in "${colors[@]}"; do
		if [ "$current_color" == "$color" ]; then
			prefix='>'
		else
			prefix=''
		fi

		printf '%2s %s\n' "$prefix" "$color"
	done
}

do_change_color() {
	_is_valid_color "$SELECTED_COLOR" \
		|| fatal "Unable to find '$SELECTED_COLOR' color in '$THEME_NAME'"

	verify_privileges

	msg "Changing color of folders to '$SELECTED_COLOR'" \
		"for '$THEME_NAME' ..."
	change_color "$SELECTED_COLOR"
	config --new --set "theme=$THEME_NAME" "color=$SELECTED_COLOR"
	update_icon_cache
}

do_revert_default() {
	verify_privileges

	msg "Restoring default folder color for '$THEME_NAME' ..."
	change_color "${DEFAULT_COLORS[$THEME_NAME]:-blue}"
	config --new
	update_icon_cache
}

do_restore_color() {
	local saved_color=''

	if config --exists; then
		THEME_NAME="$(config --get theme)"
		saved_color="$(config --get color)"
	else
		_exit "Unable to find config file."
	fi

	THEME_DIR="$(get_theme_dir)" \
		|| _exit "Unable to find '$THEME_NAME' icon theme."

	_is_valid_color "$saved_color" \
		|| _exit "Unable to find '$saved_color' color in '$THEME_NAME'."

	verify_privileges

	change_color "$saved_color"
	msg "'$saved_color' color of the folders has been restored."
}

delete_icon_caches() {
	local icon_cache user='' user_home=''

	user="$(get_user)"
	user_home="$(get_user_home)"

	declare -a icon_caches=(
		# KDE 5 icon caches
		"$user_home/.cache/icon-cache.kcache"
		"/var/tmp/kdecache-$user/icon-cache.kcache"
		# KDE 4 icon caches
		"$user_home/.kde4/cache-$(hostname)/icon-cache.kcache"
	)

	verbose "Deleting icon caches ..."
	for icon_cache in "${icon_caches[@]}"; do
		[ -e "$icon_cache" ] || continue
		rm -f "$icon_cache"
	done
}

update_icon_cache() {
	delete_icon_caches

	verbose "Rebuilding icon cache for '$THEME_NAME' ..."
	gtk-update-icon-cache -qf "$THEME_DIR" || true
}

update_icon_caches() {
	local theme=''

	delete_icon_caches

	for theme in "${!DEFAULT_COLORS[@]}"; do
		[ -f "$THEME_DIR/../$theme/index.theme" ] || continue
		verbose "Rebuilding icon cache for '$theme' ..."
		gtk-update-icon-cache -qf "$THEME_DIR/../$theme" || true
	done
}

verify_privileges() {
	_is_root_user && return 0
	_is_user_dir  && return 0

	verbose "This operation requires root privileges."

	if command -v sudo > /dev/null; then
		exec sudo XDG_DATA_DIRS="$XDG_DATA_DIRS" "$THIS_SCRIPT" "${ARGS[@]}"
	else
		fatal "You need to be root to run this command."
	fi
}

parse_args() {
	local arg='' opt=''
	local -a args=()

	# Translate --gnu-long-options to -g (short options)
	for arg; do
		case "$arg" in
			--help)           args+=( -h ) ;;
			--list)           args+=( -l ) ;;
			--theme)          args+=( -t ) ;;
			--update-caches)  args+=( -u ) ;;
			--verbose)        args+=( -v ) ;;
			--color|--colour) args+=( -C ) ;;
			--default)        args+=( -D ) ;;
			--restore)        args+=( -R ) ;;
			--version)        args+=( -V ) ;;
			--[0-9a-Z]*)
				err "illegal option -- '$arg'"
				usage 128
				;;
			*) args+=("$arg")
		esac
	done

	# Reset the positional parameters to the short options
	set -- "${args[@]}"

	while getopts ":C:DRlt:uvVh" opt; do
		case "$opt" in
			C ) OPERATIONS+=("change-color")
				SELECTED_COLOR="$OPTARG"
				;;
			D ) OPERATIONS+=("revert-default") ;;
			R ) OPERATIONS+=("restore-color") ;;
			l ) OPERATIONS+=("list-colors") ;;
			t ) THEME_NAME="$OPTARG" ;;
			u ) OPERATIONS+=("update-icon-caches") ;;
			v ) VERBOSE=1 ;;
			V ) printf "%s %s\n" "$PROGNAME" "$VERSION"
				exit 0
				;;
			h ) usage 0 ;;
			: ) err "option requires an argument -- '-$OPTARG'"
				usage 128
				;;
			\?) err "illegal option -- '-$OPTARG'"
				usage 128
				;;
		esac
	done

	shift $((OPTIND-1))

	# Return an error if any positional parameters are found
	if [ -n "$1" ]; then
		err "illegal parameter -- '$1'"
		usage 128
	fi
}

main() {
	# default values of options
	declare THEME_NAME="${THEME_NAME:-Papirus}"
	declare -i VERBOSE="${VERBOSE:-0}"
	declare -A DEFAULT_COLORS=(
		['ePapirus']='blue'
		['Papirus']='blue'
		['Papirus-Dark']='blue'
	)

	declare SELECTED_COLOR=''
	declare -a OPERATIONS=()

	parse_args "${ARGS[@]}"

	THEME_DIR="$(get_theme_dir)" \
		|| fatal "Fail to find '$THEME_NAME' icon theme."

	for operation in "${OPERATIONS[@]}"; do
		case "$operation" in
			change-color)
				do_change_color
				;;
			revert-default)
				do_revert_default
				;;
			restore-color)
				do_restore_color
				;;
			list-colors)
				cat <<- EOF
				List of available colors:

				$(list_colors)

				EOF
				;;
			update-icon-caches)
				verify_privileges
				update_icon_caches
				;;
		esac
	done

	verbose "Done!"
}

main

exit 0
