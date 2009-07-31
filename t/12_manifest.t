# $Id: 12_manifest.t 100 2009-07-30 14:46:33Z roland $
# $Revision: 100 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/elaine/trunk/HTML-Hyphenate/t/12_manifest.t $
# $Date: 2009-07-30 16:46:33 +0200 (Thu, 30 Jul 2009) $

use Test::More;
eval "use Test::CheckManifest 1.01";
plan skip_all => "Test::CheckManifest 1.01 required for testing test coverage"
  if $@;
ok_manifest( { filter => [qr/(Debian_CPANTS.txt|\.(svn|bak))/] } );
