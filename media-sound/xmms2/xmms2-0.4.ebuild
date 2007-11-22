MY_P="${P}DrKosmos"
DESCRIPTION="X(cross)platform Music Multiplexing System."
HOMEPAGE="http://xmms2.xmms.se/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"
LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="aac alsa ao avahi avcodec avformat cdda cli curl cxx daap fam flac glib gnome ices jack lastfm mad mms modplug musepack ofa perl pulse python samba sid vocoder vorbis xml xmms2d"
RESTRICT="nomirror"

DEPEND="aac? ( media-libs/faad2 )
alsa? ( media-libs/alsa-lib )
ao? ( media-libs/libao )
avahi? ( net-dns/avahi )
avcodec? ( media-video/ffmpeg )
avformat? ( media-video/ffmpeg )
cdda? ( dev-libs/libcdio media-libs/libdicsid )
curl? ( net-misc/curl )
cxx? ( dev-libs/boost )
daap? ( net-dns/avahi )
flac? ( media-libs/flac media-libs/libogg )
glib? ( dev-libs/glib:2 )
gnome? ( gnome-base/gnome-vfs )
ices? ( media-libs/libvorbis media-libs/libogg media-libs/libshout )
jack? ( media-sound/jack )
lastfm? ( net-misc/curl )
mad? ( media-libs/libmad )
mms? ( media-libs/libmms )
modplug? ( media-libs/libmodplug )
musepack? ( media-libs/libmpcdec )
ofa? ( media-libs/libofa )
perl? ( dev-lang/perl )
pulse? ( media-sound/pulseaudio )
python? ( dev-lang/python dev-python/pyrex )
samba? ( net-fs/samba )
sid? ( media-sound/sidplay )
vocoder? ( sci-libs/fftw:3.0 media-libs/libsamplerate )
vorbis? ( media-libs/libvorbis )
xml? ( dev-libs/libxml2 )"

S="${WORKDIR}/${MY_P}"

src_compile() {
	local conf oe od pe pd
	od="xmmsclient-ecore,xmmsclient-cf,dns_sd"
	if use xmms2d; then
		pe="equalizer,nulstripper,mp4,diskwrite,file,null,normalize,cue,xml,id3v2,pls,asx,wave,m3u,replaygain,icymetaint,asf"
		pd="coreaudio,mac,nms,oss,waveout"
		for p in alsa ao avcodec avformat cdda curl daap aac:faad flac gnome:gnomevfs ices jack lastfm lastfm:lastfmeta mad mms modplug musepack ofa pulse xml:rss samba vocoder vorbis xml:xspf; do
			use ${p/:*} && pe="${pe},${p/*:}" || pd="${pd},${p/*:}"
		done
		conf="${conf} --with-plugins=${pe} --without-plugins=${pd}"
	else
		conf="--without-xmms2d=1"
	fi
	for o in cli cxx:xmmsclient++ xmms2d:launcher perl fam:medialib-updater glib:xmmsclient++-glib xmms2d:et python avahi; do
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
