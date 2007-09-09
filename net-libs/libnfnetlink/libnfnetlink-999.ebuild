inherit autotools subversion

DESCRIPTION="Low-level library for netfilter related kernel/userspace communication."
HOMEPAGE="http://netfilter.org/projects/libnfnetlink/index.html"
KEYWORDS="~amd64 ~x86"

ESVN_REPO_URI="https://svn.netfilter.org/netfilter/trunk/libnfnetlink"
ESVN_BOOTSTRAP="eautoreconf"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
