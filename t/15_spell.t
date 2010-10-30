# $Id: 15_spell.t 321 2010-10-30 18:06:08Z roland $
# $Revision: 321 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/elaine/trunk/HTML-Hyphenate/t/15_spell.t $
# $Date: 2010-10-30 20:06:08 +0200 (Sat, 30 Oct 2010) $

use strict;
use warnings;
use English;
use Test::More;

if ( not $ENV{TEST_AUTHOR} ) {
    my $msg = 'Author test. Set $ENV{TEST_AUTHOR} to a true value to run.';
    plan( skip_all => $msg );
}

eval { require Test::Spelling; };

if ($EVAL_ERROR) {
    my $msg = 'Test::Spelling required to check spelling of POD';
    plan( skip_all => $msg );
}

Test::Spelling::add_stopwords(<DATA>);
Test::Spelling::all_pod_files_spelling_ok();
__DATA__
Ipenburg
buur
buurt
buurtje
cafeetje
cafee
je
tje
Readonly
