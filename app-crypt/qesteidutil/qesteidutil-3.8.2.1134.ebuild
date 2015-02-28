# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils

DESCRIPTION="Smart card manager UI application"
HOMEPAGE="http://ria.ee/"
SRC_URI="https://installer.id.ee/media/ubuntu/pool/main/q/${PN}/${PN}_${PV}-ubuntu-14-04.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}"

RDEPEND="dev-libs/openssl
	dev-libs/opensc
	sys-apps/pcsc-lite
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5"

DOCS="AUTHORS README"
