inherit subversion games

DESCRIPTION="A game similar to Super Mario Bros."
HOMEPAGE="http://supertux.lethargik.org/"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"
SLOT="2"

ESVN_REPO_URI="http://supertux.lethargik.org/svn/supertux/trunk/supertux/"

RDEPEND="virtual/opengl
media-libs/libsdl
media-libs/sdl-image
dev-games/physfs
media-libs/openal"
DEPEND="dev-util/cmake
${RDEPEND}"

src_compile() {
	sed -e "/Icon=/s/supertux/supertux2/" \
		-e "/Categories=/s/=/=Application;/" \
		-i supertux2.desktop
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_CXX_COMPILER=$(type -P $(tc-getCXX)) \
		-DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
		|| die
	emake || die
}

src_install() {
	emake DESTDIR=${D} install || die
	dodir /usr/games/bin
	mv ${D}/usr/games/supertux2 ${D}/usr/games/bin/
	cd ${D}/usr/share/doc
	mv supertux2 ${P}
	cd ${D}/usr/share/pixmaps
	mv supertux.png supertux2.png
	mv supertux.xpm supertux2.xpm
	prepgamesdirs
}
