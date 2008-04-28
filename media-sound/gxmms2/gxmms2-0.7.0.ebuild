# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="1"

inherit eutils multilib

DESCRIPTION="GTK2 based XMMS2 client written in C"
HOMEPAGE="http://wejp.k.vu/projects/xmms2/"
SRC_URI="http://wejp.k.vu/projects/xmms2/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="gkrellm"

DEPEND="media-sound/xmms2
	x11-libs/gtk+:2
	gkrellm? ( app-admin/gkrellm:2 )"

RESTRICT="mirror"

src_compile() {
	emake gxmms2 || die
	if use gkrellm; then
		emake gkrellxmms2 || die
	fi
}

src_install() {
	dobin ${PN}
	if use gkrellm; then
		insinto /usr/$(get_libdir)/gkrellm2/plugins
		doins gkrellxmms2.so
	fi
	dodoc README
	newicon gxmms2src/gxmms2_mini.xpm gxmms2.xpm
	make_desktop_entry gxmms2 GXMMS2
}
