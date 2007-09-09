# $Id$

inherit eutils

DESCRIPTION="Lugdunum eDonkey2000/eMule server"
HOMEPAGE="http://lugdunum2k.free.fr/kiten.html"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="nptl smp"
RESTRICT="binchecks mirror strip"

SRC_URI="
x86? (
	nptl? (
		smp? ( http://lugdunum2k.free.fr/files/${P}.i686-linux.nptl.gz )
		!smp? ( http://lugdunum2k.free.fr/files/${P}.i686-linux.nptl_up.gz )
	)
	!nptl? ( http://lugdunum2k.free.fr/files/${P}.i686-linux.gz )
)
amd64? (
	smp? ( http://lugdunum2k.free.fr/files/${P}.x86_64-linux.nptl.gz )
	!smp? ( http://lugdunum2k.free.fr/files/${P}.x86_64-linux.nptl_up.gz )
)"

DEPEND="dev-lang/python"

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
