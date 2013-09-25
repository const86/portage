# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git-2 cmake-utils

DESCRIPTION="A tool for grabbing video from OpenGL powered applications"
HOMEPAGE="https://github.com/const86/glgrab"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND="virtual/ffmpeg
	virtual/opengl
	media-libs/opencv"

EGIT_REPO_URI="git://github.com/const86/glgrab.git"
