# $Id$

inherit autotools subversion

DESCRIPTION="Userspace library providing a programming interface packets that have been logged by the kernel packet filter"
HOMEPAGE="http://netfilter.org/projects/libnetfilter_log/index.html"
KEYWORDS="~amd64 ~x86"

DEPEND="=net-libs/libnfnetlink-999"

ESVN_REPO_URI="https://svn.netfilter.org/netfilter/trunk/libnetfilter_log"
ESVN_BOOTSTRAP="eautoreconf"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
