# $Id: 01_boundaries.t 46 2009-01-24 23:19:13Z roland $
# $Revision: 46 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/debbie/trunk/Date-Extract-P800Picture/t/01_boundaries.t $
# $Date: 2009-01-25 00:19:13 +0100 (Sun, 25 Jan 2009) $

use utf8;
use Test::More;
use Test::NoWarnings;

my @fragments = (
    [
        'Supercalifragilisticexpialidocious',
'Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious',
        'plain word'
    ],
    [
        'Supercalifragilisticexpialidocious Supercalifragilisticexpialidocious',
'Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious',
        'plain words'
    ],
    [
        'Supercalifragilisticexpialidocious &eacute;',
'Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious é',
        'plain word and é'
    ],
    [
        'Supercalifragilisticexpialidocious é',
'Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious é',
        'plain word and é'
    ],
    [
        'Supercalifragilisticexpialidocious &lt; &gt; &amp;',
'Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious &#60; &#62; &#38;',
        'plain word, HTML encoded less than sign, greater than sign and ampersand'
    ],
    [
        'semi-in­de­pen­dent supercalifragilisticexpialidocious',
'semi-in­de­pen­dent su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious',
        'plain words including hyphen and soft hyphen'
    ],
    [
        'semi-independent supercalifragilisticexpialidocious',
'semi-in­de­pen­dent su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious',
        'plain words including hyphen'
    ],
    [
        '<p>Supercalifragilisticexpialidocious</p>',
'<p>Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</p>',
        'single word pararaph'
    ],
    [
        '<pre>Supercalifragilisticexpialidocious</pre>',
        '<pre>Supercalifragilisticexpialidocious</pre>',
        'single word pre'
    ],
    [
        '<p><nobr>Supercalifragilisticexpialidocious</nobr></p>',
        '<p><nobr>Supercalifragilisticexpialidocious</nobr></p>',
        'single word pararaph with nobr'
    ],
    [
        '<p style="white-space: nowrap">Supercalifragilisticexpialidocious</p>',
        '<p style="white-space: nowrap">Supercalifragilisticexpialidocious</p>',
        'single word pararaph with nowrap inline style'
    ],
    [
'<p class="supercalifragilisticexpialidocious">Supercalifragilisticexpialidocious</p>',
'<p class="supercalifragilisticexpialidocious">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</p>',
        'single word pararaph with class attribute'
    ],
    [
'<table><tr><th abbr="Supercalifragilisticexpialidocious">Supercalifragilisticexpialidocious</th></tr></table>',
'<table><tr><th abbr="Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</th></tr></table>',
        'single word table head with abbr attribute'
    ],
    [
'<table><tr><th nowrap>Supercalifragilisticexpialidocious</th></tr></table>',
'<table><tr><th nowrap="nowrap">Supercalifragilisticexpialidocious</th></tr></table>',
        'single word table head with nowrap attribute'
    ],
    [
        '<img alt="Supercalifragilisticexpialidocious"/>',
'<img alt="Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious" />',
        'image with alt attribute'
    ],
    [
'<select><option label="Supercalifragilisticexpialidocious">Supercalifragilisticexpialidocious</option></select>',
'<select><option label="Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</option></select>',
        'single word option with label attribute'
    ],
    [
'<div><object standby="Supercalifragilisticexpialidocious">Supercalifragilisticexpialidocious</object></div>',
'<div><object standby="Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</object></div>',
        'object with standby attribute'
    ],
    [
'<table summary="Supercalifragilisticexpialidocious"><tr><td>Supercalifragilisticexpialidocious</td></tr></table>',
'<table summary="Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious"><tr><td>Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</td></tr></table>',
        'single word table with summary attribute'
    ],
    [
'<p title="Supercalifragilisticexpialidocious">Supercalifragilisticexpialidocious</p>',
'<p title="Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious">Su­per­cal­ifrag­ilis­tic­ex­pi­ali­do­cious</p>',
        'single word pararaph with title attribute'
    ],
);

plan tests => ( 0 + @fragments ) + 1;

use HTML::Hyphenate;
my $h = HTML::Hyphenate->new();
foreach my $frag (@fragments) {
    is( $h->hyphenated( $frag->[0] ), $frag->[1], $frag->[2] );
}
