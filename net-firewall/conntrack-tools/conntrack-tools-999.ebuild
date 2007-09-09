# $Id$

inherit autotools subversion

DESCRIPTION="Tools provides access to the in-kernel connection tracking state table"
HOMEPAGE="http://netfilter.org/projects/conntrack-tools/index.html"
KEYWORDS="~amd64 ~x86"

DEPEND="=net-libs/libnfnetlink-999
	=net-libs/libnetfilter_conntrack-999"

ESVN_REPO_URI="http://svn.netfilter.org/netfilter/trunk/conntrack-tools"
ESVN_BOOTSTRAP="eautoreconf"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
