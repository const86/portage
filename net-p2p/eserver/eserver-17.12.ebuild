# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="Lugdunum eDonkey2000/eMule server"
HOMEPAGE="http://lugdunum2k.free.fr/kiten.html"
SRC_URI="
x86? (
	nptl? (
		smp? ( http://lugdunum2k.free.fr/files/${P}.i686-linux.nptl.gz )
		!smp? ( http://lugdunum2k.free.fr/files/${P}.i686-linux.nptl_up.gz ) )
	!nptl? ( http://lugdunum2k.free.fr/files/${P}.i686-linux.gz ) )
amd64? (
	smp? ( http://lugdunum2k.free.fr/files/${P}.x86_64-linux.nptl.gz )
	!smp? ( http://lugdunum2k.free.fr/files/${P}.x86_64-linux.nptl_up.gz ) )"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nptl smp"

DEPEND="dev-lang/python"

RESTRICT="binchecks mirror strip"

src_install() {
	newbin "${WORKDIR}/${A%.gz}" eserver
	dobin "${FILESDIR}/eserver-launch"
	newinitd "${FILESDIR}/eserver.initd" eserver
	newconfd "${FILESDIR}/eserver.confd" eserver
	diropts --owner eserver --mode 0700
	dodir /var/lib/eserver
}

pkg_setup() {
	enewuser eserver
}
