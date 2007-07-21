inherit eutils

DESCRIPTION="Lugdunum eDonkey2000/eMule server"
HOMEPAGE="http://lugdunum2k.free.fr/kiten.html"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE="nptl threads"
RESTRICT="binchecks mirror strip"

SRC_URI="
x86? (
	nptl? (
		threads? ( http://lugdunum2k.free.fr/files/${P}.i686-linux.nptl.gz )
		!threads? ( http://lugdunum2k.free.fr/files/${P}.i686-linux.nptl_up.gz )
	)
	!nptl? ( http://lugdunum2k.free.fr/files/${P}.i686-linux.gz )
)
amd64? (
	threads? ( http://lugdunum2k.free.fr/files/${P}.x86_64-linux.nptl.gz )
	!threads? ( http://lugdunum2k.free.fr/files/${P}.x86_64-linux.nptl_up.gz )
)"

TOOLS="launch serverlist"

src_compile() {
	for tool in ${TOOLS}; do
		$(tc-getCC) -o "${WORKDIR}/${tool}" \
			-std=c99 ${CFLAGS} "${FILESDIR}/${tool}.c" \
			|| die "Error in compiling ${tool}!"
	done
}

src_install() {
	newbin "${WORKDIR}/${A%.gz}" eserver
	for tool in ${TOOLS}; do
		newbin "${WORKDIR}/${tool}" "eserver-${tool}"
	done
	newinitd "${FILESDIR}/eserver.initd" eserver
	newconfd "${FILESDIR}/eserver.confd" eserver
	diropts --owner eserver --mode 0700
	dodir /var/lib/eserver
}

pkg_setup() {
	enewuser eserver
}
