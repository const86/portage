# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Transparent HTTP proxying library"
HOMEPAGE="http://httppc.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="net-libs/adns"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_install() {
	emake DESTDIR="${D}" PROXED_LINKS="" install
}
