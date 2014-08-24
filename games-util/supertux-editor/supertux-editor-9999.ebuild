# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit base eutils git-r3 games

DESCRIPTION="SuperTux level editor"
HOMEPAGE="http://supertux.lethargik.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="games-arcade/supertux:2
	virtual/opengl
	dev-lang/mono
	dev-dotnet/gtk-sharp:2
	dev-dotnet/glade-sharp:2"
DEPEND="${RDEPEND}
	sys-devel/m4"

EGIT_REPO_URI="https://code.google.com/p/supertux.editor/"

src_compile() {
	emake
}

src_install() {
	local dir="$(games_get_libdir)/${PN}"
	insinto "${dir}"
	doins *.dll *.dll.config supertux-editor.exe
	m4 -D DIR="${dir}" \
		"${FILESDIR}"/supertux-editor.m4 > "${WORKDIR}"/supertux-editor
	dogamesbin "${WORKDIR}"/supertux-editor
	insinto /usr/share/applications
	doins supertux-editor.desktop
	doicon supertux-editor.{png,xpm}
	prepgamesdirs
}
