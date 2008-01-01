inherit apache-module subversion

DESCRIPTION="Apache2 mod_autoindex replacement"
HOMEPAGE="http://const.tltsu.ru/svn/const/pub/mod_listdir/"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
SLOT="0"

ESVN_REPO_URI="http://const.tltsu.ru/svn/const/pub/mod_listdir/"

APACHE2_MOD_DEFINE="LISTDIR"

need_apache2_2

src_install() {
	insinto "/usr/share/${PN}"
	doins listdir.xsl listdir.dtd || die
	insinto "${APACHE2_MODULES_CONFDIR}"
	newins "${PN}.conf" "20_${PN}.conf" || die
	apache-module_src_install
}

pkg_postinst() {
	apache-module_pkg_postinst
	einfo "To enable ${PN} you need to disable loading mod_autoindex."
	einfo "You may want to copy XSL stylesheet into site directory."
	einfo "If present mod_transform is used to perform"
	einfo "XSL tranformation on server side."
	einfo
}
