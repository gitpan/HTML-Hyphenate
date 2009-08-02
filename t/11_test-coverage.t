# $Id: 11_test-coverage.t 116 2009-08-02 20:43:55Z roland $
# $Revision: 116 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/elaine/trunk/HTML-Hyphenate/t/11_test-coverage.t $
# $Date: 2009-08-02 22:43:55 +0200 (Sun, 02 Aug 2009) $

use strict;
use warnings;
use utf8;

use Test::More;
if ( !eval { require Test::TestCoverage; 1 } ) {
	plan skip_all => q{Test::TestCoverage required for testing test coverage};
}
plan tests => 1;
Test::TestCoverage::test_coverage("HTML::Hyphenate");

my $obj = HTML::Hyphenate->new();
$obj->hyphenated(q{<p>hyphenated hyphenation</p>});

Test::TestCoverage::ok_test_coverage('HTML::Hyphenate');
