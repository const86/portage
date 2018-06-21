# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit cmake-utils

DESCRIPTION="Estonian ID card digital signature desktop tools"
HOMEPAGE="http://ria.ee/"
SRC_URI="https://installer.id.ee/media/sources/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/libdigidocpp
	dev-libs/openssl:0
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtprintsupport:5
	net-nds/openldap"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5"

DOCS="AUTHORS README"
