# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils git-2

DESCRIPTION="XMMS2 client written with C++/Qt4"
HOMEPAGE="http://wiki.xmms2.xmms.se/index.php/Client:Esperanza"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-sound/xmms2[cxx]
	x11-libs/qt-core:4
	x11-libs/qt-gui:4"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="git://git.xmms.se/xmms2/${PN}.git"

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
