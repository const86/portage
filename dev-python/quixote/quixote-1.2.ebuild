inherit distutils

MY_P=${P/q/Q}
DESCRIPTION="Python HTML templating framework for developing web applications."
HOMEPAGE="http://www.quixote.ca/"
SRC_URI="http://www.quixote.ca/releases/${MY_P}.tar.gz"

LICENSE="CNRI"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc ppc-macos"
IUSE=""

DEPEND=">=dev-lang/python-2.3"
S=${WORKDIR}/${MY_P}

src_install() {
	mydoc="ACKS CHANGES LICENSE MANIFEST.in README TODO"
	distutils_src_install
	dodoc doc/*.txt
	dohtml doc/*.html
	dodir /usr/share/${PN}/demo
	insinto /usr/share/${PN}/demo
	doins demo/*
}
