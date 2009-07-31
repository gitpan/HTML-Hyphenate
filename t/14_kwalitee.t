# $Id: 14_kwalitee.t 100 2009-07-30 14:46:33Z roland $
# $Revision: 100 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/elaine/trunk/HTML-Hyphenate/t/14_kwalitee.t $
# $Date: 2009-07-30 16:46:33 +0200 (Thu, 30 Jul 2009) $

use Test::More;

eval {
    require Test::Kwalitee;
    Test::Kwalitee->import( tests => [qw( -has_meta_yml)] );
};

plan( skip_all => 'Test::Kwalitee not installed; skipping' ) if $@;
