# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="XMMS2 client written with C++/Qt4"
HOMEPAGE="http://wiki.xmms2.xmms.se/index.php/Client:Esperanza"
SRC_URI="http://exodus.xmms.se/~tru/${PN}/0.4/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="media-sound/xmms2[-nocxx]
	x11-libs/qt-core:4
	x11-libs/qt-gui:4"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_configure() {
	./configure --prefix=/usr || die
}

src_compile() {
	emake || die
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die
	doicon data/images/esperanza.png
	make_desktop_entry esperanza Esperanza
}
