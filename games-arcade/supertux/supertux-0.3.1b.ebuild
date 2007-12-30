inherit games

DESCRIPTION="A game similar to Super Mario Bros."
HOMEPAGE="http://supertux.lethargik.org/"
KEYWORDS="amd64 x86"
LICENSE="GPL-2"
SLOT="2"

SRC_URI="http://download.berlios.de/${PN}/${P}.tar.bz2"

RDEPEND="virtual/opengl
media-libs/libsdl
media-libs/sdl-image
dev-games/physfs
media-libs/openal"
DEPEND="dev-util/cmake
${RDEPEND}"

S="${WORKDIR}/${PN}-${PV%[a-z]}"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch "${FILESDIR}/0.3.1.patch"
}

src_compile() {
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBINDIR=/usr/games/bin \
		-DDATADIR=/usr/share/games \
		-DDOCDIR=/usr/share/doc/${P} \
		-DCMAKE_CXX_COMPILER=$(type -P $(tc-getCXX)) \
		-DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
		|| die
	emake || die
}

src_install() {
	emake DESTDIR=${D} install || die
	prepgamesdirs
}
