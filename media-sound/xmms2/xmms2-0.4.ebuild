MY_P="${P}DrKosmos"
DESCRIPTION="X(cross)platform Music Multiplexing System."
HOMEPAGE="http://xmms2.xmms.se/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"
LICENSE="GPL-2 LGPL-2.1"
RESTRICT="nomirror"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="aac alsa ao avahi cdda cli curl cxx fam flac ffmpeg gnome icecast jack mad mms modplug musepack ofa perl pulseaudio python samba sid vocoder vorbis xml xmms2d"

RDEPEND="dev-libs/glib:2
dev-db/sqlite:3
aac? ( media-libs/faad2 )
alsa? ( media-libs/alsa-lib )
ao? ( media-libs/libao )
avahi? ( net-dns/avahi )
cdda? ( dev-libs/libcdio media-libs/libdicsid )
curl? ( net-misc/curl )
cxx? ( dev-libs/boost )
flac? ( media-libs/flac media-libs/libogg )
ffmpeg? ( media-video/ffmpeg )
gnome? ( gnome-base/gnome-vfs )
icecast? ( media-libs/libvorbis media-libs/libogg media-libs/libshout )
jack? ( media-sound/jack )
mad? ( media-libs/libmad )
mms? ( media-libs/libmms )
modplug? ( media-libs/libmodplug )
musepack? ( media-libs/libmpcdec )
ofa? ( media-libs/libofa )
perl? ( dev-lang/perl )
pulseaudio? ( media-sound/pulseaudio )
samba? ( net-fs/samba )
sid? ( media-sound/sidplay )
vocoder? ( sci-libs/fftw:3.0 media-libs/libsamplerate )
vorbis? ( media-libs/libvorbis )
xml? ( dev-libs/libxml2 )"

DEPEND="${RDEPEND}
dev-lang/python
python? ( dev-python/pyrex )"

S="${WORKDIR}/${MY_P}"

src_compile() {
	local conf oe od pe pd
	if use xmms2d; then
		pe="asf,asx,cue,diskwrite,equalizer,file,id3v2,icymetaint,m3u,mp4,normalize,null,nulstripper,pls,replaygain,wave,xml"
		pd="coreaudio,mac,nms,oss,waveout"
		for p in alsa ao ffmpeg:avcodec ffmpeg:avformat cdda curl avahi:daap aac:faad flac gnome:gnomevfs icecast:ices jack curl:lastfm curl:lastfmeta mad mms modplug musepack ofa pulseaudio:pulse xml:rss samba vocoder vorbis xml:xspf; do
			use ${p/:*} && pe="${pe},${p/*:}" || pd="${pd},${p/*:}"
		done
		conf="${conf} --with-plugins=${pe} --without-plugins=${pd}"
	else
		conf="--without-xmms2d=1"
	fi
	od="dns_sn,xmmsclient-ecore,xmmsclient-cf"
	for o in avahi cli xmms2d:et xmms2d:launcher fam:medialib-updater perl python cxx:xmmsclient++ cxx:xmmsclient++-glib; do
		use ${o/:*} && oe="${oe},${o/*:}" || od="${od},${o/*:}"
	done
	conf="${conf} --without-optionals=${od}"
	[ -n "${oe}" ] && conf="${conf} --with-optionals=${oe/,}"
	echo ./waf --prefix=/usr --conf-prefix=/etc ${conf} configure
	./waf --prefix=/usr --conf-prefix=/etc ${conf} configure \
		|| die "configure failed"
	./waf ${MAKEOPTS} build || die "build failed"
}

src_install() {
	./waf --destdir=${D} install || die "install failed"
}
