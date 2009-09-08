# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

ewaf() {
	local -a args=("$@")
	local -a opts
	set -- ${MAKEOPTS}
	while [ $# -gt 0 ]
	do
		case $1 in
			-j|--jobs)
				if [[ "$2" != -* ]]
				then
					opts=("${opts[@]}" -j "$2")
					shift
				fi
				;;
			-k|--jobs\=*|-j*)
				opts=("${opts[@]}" "$1")
				;;
			--keep-going)
				opts=("${opts[@]}" -k)
				;;
		esac
		shift
	done
	CCFLAGS=${CFLAGS} LINKFLAGS=${LDFLAGS} ./waf "${opts[@]}" "${args[@]}"
}
