# $Id: 11_test-coverage.t 100 2009-07-30 14:46:33Z roland $
# $Revision: 100 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/elaine/trunk/HTML-Hyphenate/t/11_test-coverage.t $
# $Date: 2009-07-30 16:46:33 +0200 (Thu, 30 Jul 2009) $

use Test::More;
eval "use Test::TestCoverage 0.08";
plan skip_all => "Test::TestCoverage 0.08 required for testing test coverage"
  if $@;

plan tests => 1;
test_coverage("Date::Extract::P800Picture");

my $obj = Date::Extract::P800Picture->new();
$obj->filename("8B481234.JPG");
$obj->extract();

ok_test_coverage('Date::Extract::P800Picture');
