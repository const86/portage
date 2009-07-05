# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="Computer Modern unicode OpenType fonts"
HOMEPAGE="http://canopus.iacp.dvo.ru/~panov/cm-unicode/"
SRC_URI="mirror://sourceforge/${PN}/${P}-otf.tar.xz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND="app-arch/xz-utils"

RESTRICT="mirror strip binchecks"

DOCS="Changes FAQ README TODO"

FONT_SUFFIX="otf"

src_unpack() {
	xzdec "${DISTDIR}/${A}" | tar x -C "${WORKDIR}"
}
