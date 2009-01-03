# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit git

DESCRIPTION="GTK2 XMMS2 client written in Vala, with focus on collections"
HOMEPAGE="http://abraca.xmms.se/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-sound/xmms2"
DEPEND="${RDEPEND}
	dev-lang/vala[gtk]"

EGIT_REPO_URI="git://git.xmms.se/xmms2/${PN}.git"

src_compile() {
	./scons PREFIX=/usr ${MAKEOPTS} || die
}

src_install() {
	./scons DESTDIR="${D}" install
}
