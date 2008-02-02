# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils

MY_P=${P/q/Q}

DESCRIPTION="Flexible and powerful framework for writing Web-based applications using Python"
HOMEPAGE="http://www.quixote.ca/"
SRC_URI="http://www.quixote.ca/releases/${MY_P}.tar.gz"

LICENSE="CNRI-QUIXOTE-2.4"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-lang/python-2.3"

S=${WORKDIR}/${MY_P}
RESTRICT="mirror"

src_install() {
	DOCS="ACKS.txt CHANGES.txt"
	distutils_src_install
	dodoc doc/*.txt
	dohtml doc/*.html
}
