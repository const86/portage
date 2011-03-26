# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit base subversion autotools

DESCRIPTION="The Tremor integer-only reference Vorbis decoder"
HOMEPAGE="http://www.xiph.org/vorbis/"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="media-libs/libogg"
DEPEND="${RDEPEND}"

ESVN_REPO_URI="http://svn.xiph.org/trunk/Tremor/"
ESVN_BOOTSTRAP="eautoreconf"
