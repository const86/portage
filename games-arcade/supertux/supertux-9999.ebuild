# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3 cmake-utils

DESCRIPTION="Classic 2D jump'n run sidescroller game similar to SuperMario: Milestone 2"
HOMEPAGE="http://supertuxproject.org/"

LICENSE="GPL-2"
SLOT="0"
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

EGIT_REPO_URI="https://github.com/SuperTux/supertux.git"

CMAKE_IN_SOURCE_BUILD=true

src_unpack() {
	git-r3_src_unpack
	export GIT_DIR="${EGIT_DIR}"
}

src_configure() {
	local mycmakeargs=(
		-DINSTALL_SUBDIR_BIN=bin
		-DINSTALL_SUBDIR_SHARE=share/supertux2
	)
	cmake-utils_src_configure
}
