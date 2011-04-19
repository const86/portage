# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

DESCRIPTION="GTK2 XMMS2 client written in Vala, with focus on collections"
HOMEPAGE="http://abraca.xmms.se/"
SRC_URI="http://abraca.xmms.se/attachments/download/134/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-sound/xmms2
	x11-libs/gtk+:2
	dev-libs/libgee"
DEPEND="${RDEPEND}
	dev-lang/vala:0.10"

src_compile() {
	./scons PREFIX=/usr VALAC=/usr/bin/valac-0.10 || die
}

src_install() {
	./scons DESTDIR="${D}" VALAC=/usr/bin/valac-0.10 install
}
