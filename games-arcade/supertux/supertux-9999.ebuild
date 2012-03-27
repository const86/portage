# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit base git-2 games cmake-utils

DESCRIPTION="Classic 2D jump'n run sidescroller game similar to SuperMario: Milestone 2"
HOMEPAGE="http://supertux.lethargik.org/"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS=""
IUSE=""

RDEPEND="virtual/opengl
	media-libs/glew
	media-libs/libsdl
	media-libs/sdl-image
	dev-games/physfs
	media-libs/openal"
DEPEND="${RDEPEND}
	dev-libs/boost"

EGIT_REPO_URI="https://code.google.com/p/supertux/"
PATCHES=( "${FILESDIR}/9999-fs-layout.patch"
	"${FILESDIR}/desktop.patch"
	"${FILESDIR}/9999-compile.patch" )

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	base_src_prepare
}

src_install() {
	cmake-utils_src_install
	prepgamesdirs
}
