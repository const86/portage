# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="GTK2 XMMS2 client written in Vala, with focus on collections"
HOMEPAGE="http://abraca.xmms.se/"
SRC_URI="http://abraca.xmms.se/attachments/download/128/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-sound/xmms2
	x11-libs/gtk+
	dev-libs/libgee"
DEPEND="${RDEPEND}
	<dev-lang/vala-0.8"

src_compile() {
	./scons PREFIX=/usr || die
}

src_install() {
	./scons DESTDIR="${D}" install
}