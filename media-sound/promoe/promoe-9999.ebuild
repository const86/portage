# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="1"

inherit eutils git qt4

DESCRIPTION="WinAMP2 skinable XMMS2 client"
HOMEPAGE="http://wiki.xmms2.xmms.se/index.php/Client:Promoe"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-sound/xmms2
	>=x11-libs/qt-4.2:4"

EGIT_REPO_URI="git://git.xmms.se/xmms2/promoe.git"

pkg_setup() {
	if built_with_use media-sound/xmms2 nocxx; then
		eerror "You have disabled C++ support in media-sound/xmms2!"
		eerror "Rebuild media-sound/xmms2 with USE=-nocxx"
		die
	fi
}

src_compile() {
	eqmake4 || die
	emake || die
}

src_install() {
	dobin promoe || die
	dodoc AUTHORS README TODO
	newicon data/icon.png promoe.png
	make_desktop_entry promoe Promoe
}
