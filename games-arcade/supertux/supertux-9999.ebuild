# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit subversion games
inherit cmake-utils

DESCRIPTION="Classic 2D jump'n run sidescroller game similar to SuperMario: Milestone 2"
HOMEPAGE="http://supertux.lethargik.org/"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="~amd64 ~x86"

DEPEND="virtual/opengl
	media-libs/libsdl
	media-libs/sdl-image
	dev-games/physfs
	media-libs/openal"

ESVN_REPO_URI="http://supertux.lethargik.org/svn/supertux/trunk/supertux/"
ESVN_PATCHES="9999-fs-layout.patch
	9999-install-fonts.patch
	desktop.patch"

EXTRA_ECONF="-D WERROR=OFF"

src_install() {
	cmake-utils_src_install
	prepgamesdirs
}
