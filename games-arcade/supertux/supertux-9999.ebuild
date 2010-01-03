# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion games cmake-utils

DESCRIPTION="Classic 2D jump'n run sidescroller game similar to SuperMario: Milestone 2"
HOMEPAGE="http://supertux.lethargik.org/"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS=""
IUSE=""

DEPEND="virtual/opengl
	media-libs/glew
	media-libs/libsdl
	media-libs/sdl-image
	dev-games/physfs
	media-libs/openal"
RDEPEND="${DEPEND}"

ESVN_REPO_URI="http://supertux.lethargik.org/svn/supertux/trunk/supertux/"
ESVN_PATCHES="9999-fs-layout.patch
	9999-fixes.patch
	desktop.patch"

src_unpack() {
	subversion_src_unpack
}

src_install() {
	cmake-utils_src_install
	prepgamesdirs
}
