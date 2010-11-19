# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="GTK2 XMMS2 client written in Vala, with focus on collections"
HOMEPAGE="http://abraca.xmms.se/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="media-sound/xmms2
	x11-libs/gtk+
	dev-libs/libgee"
DEPEND="${RDEPEND}
	dev-lang/vala:0.10"

EGIT_REPO_URI="git://git.xmms.se/xmms2/${PN}.git"

src_compile() {
	./scons PREFIX=/usr VALAC=valac-0.10 || die
}

src_install() {
	./scons DESTDIR="${D}" VALAC=valac-0.10 install
}
