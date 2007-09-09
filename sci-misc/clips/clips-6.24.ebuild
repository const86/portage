# $Id$

inherit eutils

DESCRIPTION="Productive development and delivery expert system tool."
HOMEPAGE="http://www.ghg.net/clips/CLIPS.html"
SRC_URI="http://www.ghg.net/clips/download/source/clipssrc.tar.Z"

SLOT="0"
LICENSE="BSD style"
KEYWORDS="amd64 x86"

S="${WORKDIR}/clipssrc"

src_compile() {
	cd clipssrc
	$(tc-getCC) ${CFLAGS} -lm -o ../${PN} *.c || die
}

src_install() {
	dobin ${PN}
}
