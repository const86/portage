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
	sed -i "s:\"games/\":\"games/bin/\":" CMakeLists.txt
	cmake \
		-DCMAKE_CXX_COMPILER=$(type -P $(tc-getCXX)) \
		-DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		|| die
	emake || die
}

src_install() {
	emake DESTDIR=${D} install || die
	prepgamesdirs
}
