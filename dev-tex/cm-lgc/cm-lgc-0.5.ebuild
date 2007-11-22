DESCRIPTION="Type 1 CM-based fonts for Latin, Greek and Cyrillic"
HOMEPAGE="http://tug.ctan.org/tex-archive/fonts/ps-type1/cm-lgc/"
SRC_URI="http://mirrors.ibiblio.org/pub/mirrors/CTAN/fonts/ps-type1/${PN}.zip"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
S="${WORKDIR}/${PN}"

DEPEND="=app-text/tetex-3*"

src_install() {
	dodir /usr/share/texmf-site
	mv fonts omega tex ${D}/usr/share/texmf-site
	insinto /usr/share/texmf-site/fonts/enc/dvips/cm-lgc
	doins dvips/base/8r-mod.enc
	insinto /usr/share/texmf-site/fonts/map/dvips/cm-lgc
	doins dvips/config/cm-lgc.map
	insinto /etc/texmf/updmap.d
	newins ${FILESDIR}/updmap.cfg 10cm-lgc.cfg
}

pkg_postinst() {
	/usr/sbin/texmf-update
}

pkg_postrm() {
	/usr/sbin/texmf-update
}
