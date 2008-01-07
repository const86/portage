# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="Productive development and delivery expert system tool"
HOMEPAGE="http://www.ghg.net/clips/CLIPS.html"
SRC_URI="http://www.ghg.net/clips/download/source/clipssrc.tar.Z"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

S="${WORKDIR}/clipssrc"

src_compile() {
	cd clipssrc
	$(tc-getCC) ${CFLAGS} -lm -o ../${PN} *.c || die
}

src_install() {
	dobin ${PN}
}
