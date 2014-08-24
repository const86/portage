# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit base games cmake-utils

DESCRIPTION="Classic 2D jump'n run sidescroller game similar to SuperMario: Milestone 2"
HOMEPAGE="http://supertux.lethargik.org/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/opengl
	media-libs/glew
	media-libs/libsdl
	media-libs/sdl-image
	net-misc/curl
	media-libs/libvorbis
	dev-games/physfs
	media-libs/openal"
DEPEND="${RDEPEND}
	dev-libs/boost"

RESTRICT="mirror"

src_configure() {
	local mycmakeargs=(
		-DINSTALL_SUBDIR_BIN=games/bin
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	prepgamesdirs
}
