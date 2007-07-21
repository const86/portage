inherit autotools subversion

DESCRIPTION="Userspace library providing a programming interface (API) to the in-kernel connection tracking state table"
HOMEPAGE="http://netfilter.org/projects/libnetfilter_conntrack/index.html"
KEYWORDS="~amd64 ~x86"

DEPEND="=net-libs/libnfnetlink-999"

ESVN_REPO_URI="https://svn.netfilter.org/netfilter/trunk/libnetfilter_conntrack"
ESVN_BOOTSTRAP="eautoreconf"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
