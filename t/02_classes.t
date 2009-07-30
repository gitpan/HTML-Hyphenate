# $Id: 01_boundaries.t 46 2009-01-24 23:19:13Z roland $
# $Revision: 46 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/debbie/trunk/Date-Extract-P800Picture/t/01_boundaries.t $
# $Date: 2009-01-25 00:19:13 +0100 (Sun, 25 Jan 2009) $

use utf8;
use Test::More;
use Test::NoWarnings;

my $INCLUDE_BY_DEFAULT = 1;
my $EXCLUDE_BY_DEFAULT = 0;
my @fragments = (
    [
		[], [], $INCLUDE_BY_DEFAULT,
'<p><span class="shy">Supercalifragilisticexpialidocious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
'<p><span class="shy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span> <span class="noshy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span></p>',
        'no classes included or excluded'
    ],
    [
		['shy'], ['noshy'], $INCLUDE_BY_DEFAULT,
'<p><span class="shy">Supercalifragilisticexpialidocious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
'<p><span class="shy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
        'sibling classes included and excluded'
    ],
    [
		['shy'], ['noshy'], $INCLUDE_BY_DEFAULT,
'<p><span class="shy noshy">Supercalifragilisticexpialidocious</span> <span class="noshy shy">Supercalifragilisticexpialidocious</span></p>',
'<p><span class="shy noshy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span> <span class="noshy shy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span></p>',
        'sibling classes both included and excluded'
    ],
    [
		['shy'], ['noshy'], $EXCLUDE_BY_DEFAULT,
'<p><span class="shy noshy">Supercalifragilisticexpialidocious</span> <span class="noshy shy">Supercalifragilisticexpialidocious</span></p>',
'<p><span class="shy noshy">Supercalifragilisticexpialidocious</span> <span class="noshy shy">Supercalifragilisticexpialidocious</span></p>',
        'sibling classes both included and excluded excluded by default'
    ],
    [
		['shy'], ['noshy'], $INCLUDE_BY_DEFAULT,
'<p class="shy"><span>Supercalifragilisticexpialidocious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
'<p class="shy"><span>Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
        'parent classes included and excluded'
    ],
    [
		['shy'], ['noshy'], $INCLUDE_BY_DEFAULT,
'<p class="noshy"><span>Supercalifragilisticexpialidocious</span> <span class="shy">Supercalifragilisticexpialidocious</span></p>',
'<p class="noshy"><span>Supercalifragilisticexpialidocious</span> <span class="shy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span></p>',
        'parent classes excluded and included'
    ],
    [
		['shy', 'other'], ['noshy', 'different'], $INCLUDE_BY_DEFAULT,
'<p><span class="shy">Supercalifragilisticexpialidocious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
'<p><span class="shy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
        'sibling classes included and excluded with multiple classes defined'
    ],
    [
		['shy', 'other'], ['noshy', 'different'], $INCLUDE_BY_DEFAULT,
'<p class="shy"><span>Supercalifragilisticexpialidocious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
'<p class="shy"><span>Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
        'parent classes included and excluded with multiple classes defined'
    ],
    [
		['shy', 'other'], ['noshy', 'different'], $INCLUDE_BY_DEFAULT,
'<p class="noshy"><span>Supercalifragilisticexpialidocious</span> <span class="shy">Supercalifragilisticexpialidocious</span></p>',
'<p class="noshy"><span>Supercalifragilisticexpialidocious</span> <span class="shy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span></p>',
        'parent classes excluded and included with multiple classes defined'
    ],
    [
		[], [], $EXCLUDE_BY_DEFAULT,
'<p><span class="shy">Supercalifragilisticexpialidocious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
'<p><span class="shy">Supercalifragilisticexpialidocious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
        'no classes included or excluded exclude by default'
    ],
    [
		['shy'], ['noshy'], $EXCLUDE_BY_DEFAULT,
'<p><span class="shy">Supercalifragilisticexpialidocious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
'<p><span class="shy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
        'sibling classes included and excluded exclude by default'
    ],
    [
		['shy'], ['noshy'], $EXCLUDE_BY_DEFAULT,
'<p class="shy"><span>Supercalifragilisticexpialidocious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
'<p class="shy"><span>Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
        'parent classes included and excluded exclude by default'
    ],
    [
		['shy'], ['noshy'], $EXCLUDE_BY_DEFAULT,
'<p class="noshy"><span>Supercalifragilisticexpialidocious</span> <span class="shy">Supercalifragilisticexpialidocious</span></p>',
'<p class="noshy"><span>Supercalifragilisticexpialidocious</span> <span class="shy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span></p>',
        'parent classes excluded and included exclude by default'
    ],
    [
		['shy', 'other'], ['noshy', 'different'], $EXCLUDE_BY_DEFAULT,
'<p><span class="shy">Supercalifragilisticexpialidocious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
'<p><span class="shy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
        'sibling classes included and excluded with multiple classes defined exclude by default'
    ],
    [
		['shy', 'other'], ['noshy', 'different'], $EXCLUDE_BY_DEFAULT,
'<p class="shy"><span>Supercalifragilisticexpialidocious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
'<p class="shy"><span>Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span> <span class="noshy">Supercalifragilisticexpialidocious</span></p>',
        'parent classes included and excluded with multiple classes defined exclude by default'
    ],
    [
		['shy', 'other'], ['noshy', 'different'], $EXCLUDE_BY_DEFAULT,
'<p class="noshy"><span>Supercalifragilisticexpialidocious</span> <span class="shy">Supercalifragilisticexpialidocious</span></p>',
'<p class="noshy"><span>Supercalifragilisticexpialidocious</span> <span class="shy">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</span></p>',
        'parent classes excluded and included with multiple classes defined exclude by default'
    ],
);

plan tests => ( 0 + @fragments ) + 1;

use HTML::Hyphenate;
my $h = HTML::Hyphenate->new();
foreach my $frag (@fragments) {
	$h->classes_included($frag->[0]);
	$h->classes_excluded($frag->[1]);
	$h->default_included($frag->[2]);
    is( $h->hyphenated( $frag->[3] ), $frag->[4], $frag->[5] );
}
