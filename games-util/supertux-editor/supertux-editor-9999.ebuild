# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="1"

inherit subversion games

DESCRIPTION="SuperTux level editor"
HOMEPAGE="http://supertux.lethargik.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="games-arcade/supertux:2
	virtual/opengl
	dev-lang/mono
	dev-dotnet/gtk-sharp:2
	dev-dotnet/glade-sharp:2"
DEPEND="${RDEPEND}
	dev-util/jam"

ESVN_REPO_URI="http://supertux.lethargik.org/svn/supertux/trunk/supertux-sharp/"

src_compile() {
	sed -e "s:\"/usr/games/supertux\":\"/usr/games/bin/supertux2\":" \
		-e "s:\"/usr/share/games/supertux\":\"/usr/share/games/supertux2\":" \
		-i supertux-editor/Settings.cs || die
	jam || die
}

src_install() {
	local dir="$(games_get_libdir)/${PN}"
	insinto "${dir}"
	doins *.dll *.dll.config supertux-editor.exe
	m4 -D DIR="${dir}" "${FILESDIR}"/supertux-editor.m4 > "${WORKDIR}"/supertux-editor
	dogamesbin "${WORKDIR}"/supertux-editor
	insinto /usr/share/applications
	doins supertux-editor.desktop
	insinto /usr/share/pixmaps
	doins supertux-editor.{png,xpm}
	prepgamesdirs
}
