# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools base git linux-info

DESCRIPTION="Multicast Routing Daemon using only IGMP signalling"
HOMEPAGE="http://sourceforge.net/projects/igmpproxy"

LICENSE="GPL-2 Stanford"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND=""

EGIT_REPO_URI="git://const.mimas.ru/${PN}/"
EGIT_BOOTSTRAP="eautoreconf"
CONFIG_CHECK="IP_MULTICAST IP_MROUTE"

src_install() {
	base_src_install
	newinitd "${FILESDIR}/${PN}-init.d" ${PN} || die
	newconfd "${FILESDIR}/${PN}-conf.d" ${PN} || die
}
