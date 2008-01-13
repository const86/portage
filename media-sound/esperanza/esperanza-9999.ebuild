# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="1"

inherit eutils git

DESCRIPTION="XMMS2 client written with C++/Qt4"
HOMEPAGE="http://wiki.xmms2.xmms.se/index.php/Client:Esperanza"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-sound/xmms2
	x11-libs/qt:4"

EGIT_REPO_URI="git://git.xmms.se/xmms2/esperanza.git"

pkg_setup() {
	if built_with_use media-sound/xmms2 nocxx; then
		eerror "You have disabled C++ support in media-sound/xmms2!"
		eerror "Rebuild media-sound/xmms2 with USE=-nocxx"
		die
	fi
}

src_compile() {
	./configure --prefix=/usr || die
	emake || die
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die
	insinto /usr/share/applications
	doins "${FILESDIR}/esperanza.desktop"
	insinto /usr/share/pixmaps
	doins data/images/esperanza.png
}
