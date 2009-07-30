# $Id: 00_base.t 49 2009-01-27 23:00:15Z roland $
# $Revision: 49 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/debbie/trunk/Date-Extract-P800Picture/t/00_base.t $
# $Date: 2009-01-28 00:00:15 +0100 (Wed, 28 Jan 2009) $

use Test::More;
use Test::NoWarnings;

BEGIN {
    @methods = qw();
    plan tests => ( 4 + @methods ) + 1;
    ok(1);    # If we made it this far, we're ok.
    use_ok('HTML::Hyphenate');
}
diag( "Testing HTML::Hyphenate $HTML::Hyphenate::VERSION" );
my $hyphen = new_ok('HTML::Hyphenate');

@HTML::Hyphenate::Sub::ISA = qw(HTML::Hyphenate);
TODO: {
    todo_skip 'Empty subclass of Class::Meta::Express issue', 1 if 1;
    my $hyphen_sub = new_ok('HTML::Hyphenate::Sub');
}

foreach my $method (@methods) {
    can_ok( 'HTML::Hyphenate', $method );
}
