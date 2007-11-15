inherit eutils

DESCRIPTION="Unicode version of tex with other enhancements."
HOMEPAGE="http://scripts.sil.org/xetex"
SRC_URI="http://scripts.sil.org/svn-view/xetex/TAGS/${P}.tar.gz"

LICENSE="XeTeX"
SLOT="0"
KEYWORDS="amd64 hppa ia64 ppc ppc64 sparc x86"
IUSE=""

DEPEND=">=app-text/tetex-3.0"
RDEPEND="${DEPEND}
>app-text/xdvipdfmx-0.3"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${PN}-install.patch"
}

src_compile() {
	sh build-xetex || die "build-xetex failed"
}

src_install() {
	sh -x install-xetex || die "install-xetex failed"
	dosym xetex /usr/bin/xelatex
	dosym unicode-letters.tex /usr/share/texmf/tex/generic/xetex/xplain.tex
	insinto /etc/texmf/fmtutil.d
	newins ${FILESDIR}/fmtutil.cnf 10xetex.cnf
	insinto /etc/texmf/texmf.d
	newins ${FILESDIR}/texmf.cnf 000xelatex.cnf
	dodir /usr/share/texmf-site/tex/generic
	cd ${D}usr/share
	mv texmf/tex/generic/hyphen texmf-site/tex/generic/
}

pkg_postinst() {
	sed -r -e "/^(magyar|serbian)/s/^/%! /" \
		-i /etc/texmf/tex/generic/config/language.dat
	/usr/sbin/texmf-update
}

pkg_postrm() {
	/usr/sbin/texmf-update
}
