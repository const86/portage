# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils qt4 git

DESCRIPTION="WinAMP2 skinable XMMS2 client"
HOMEPAGE="http://wiki.xmms2.xmms.se/index.php/Client:Promoe"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-sound/xmms2[-nocxx]
	x11-libs/qt-core:4
	x11-libs/qt-gui:4"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="git://git.xmms.se/xmms2/${PN}.git"

src_compile() {
	eqmake4 || die
	emake || die
}

src_install() {
	dobin promoe || die
	doman promoe.1 || die
	dodoc AUTHORS README TODO
	newicon data/icon.png promoe.png
	make_desktop_entry promoe Promoe
}
