# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit subversion games

DESCRIPTION="Classic 2D jump'n run sidescroller game similar to SuperMario: Milestone 2"
HOMEPAGE="http://supertux.lethargik.org/"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="~amd64 ~x86"

RDEPEND="virtual/opengl
	media-libs/libsdl
	media-libs/sdl-image
	dev-games/physfs
	media-libs/openal"
DEPEND="${RDEPEND}
	dev-util/cmake"

ESVN_REPO_URI="http://supertux.lethargik.org/svn/supertux/trunk/supertux/"
ESVN_PATCHES="cmakelists.patch desktop.patch"

src_compile() {
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_CXX_COMPILER=$(type -P $(tc-getCXX)) \
		-DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
		|| die
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	cd "${D}/usr/share/doc"
	mv supertux2 ${P}
	cd "${D}/usr/share/pixmaps"
	mv supertux.png supertux2.png
	mv supertux.xpm supertux2.xpm
	prepgamesdirs
}
