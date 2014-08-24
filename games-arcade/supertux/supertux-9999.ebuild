# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit base git-r3 games cmake-utils

DESCRIPTION="Classic 2D jump'n run sidescroller game similar to SuperMario: Milestone 2"
HOMEPAGE="http://supertux.lethargik.org/"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS=""
IUSE=""

RDEPEND="virtual/opengl
	media-libs/glew
	media-libs/libsdl2
	media-libs/sdl2-image
	media-libs/libvorbis
	dev-games/physfs
	media-libs/openal"
DEPEND="${RDEPEND}
	dev-libs/boost"

EGIT_REPO_URI="https://code.google.com/p/supertux/"

src_unpack() {
	git-r3_src_unpack
	export GIT_DIR="${EGIT_DIR}"
}

src_prepare() {
	base_src_prepare
}

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
