# $Id$

inherit autotools subversion

DESCRIPTION="Tools provides access to the in-kernel connection tracking state table"
HOMEPAGE="http://netfilter.org/projects/conntrack-tools/index.html"
KEYWORDS="~amd64 ~x86"
IUSE="mysql pcap postgres sqlite"

DEPEND="=net-libs/libnetfilter_conntrack-999
	=net-libs/libnetfilter_log-999
	mysql? ( virtual/mysql )
	pcap? ( net-libs/libpcap )
	postgres? ( dev-db/libpq )
	sqlite? ( dev-db/sqlite:3 )"

ESVN_REPO_URI="https://svn.netfilter.org/netfilter/branches/ulog/ulogd2/"
ESVN_BOOTSTRAP="eautoreconf"

src_compile() {
	econf \
		$(use_with mysql) \
		$(use_with pcap) \
		$(use_with postgres pgsql) \
		$(use_with sqlite sqlite3) \
		|| die "configure failed"
	emake || "make failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
