# $Id: 00_base.t 100 2009-07-30 14:46:33Z roland $
# $Revision: 100 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/elaine/trunk/HTML-Hyphenate/t/00_base.t $
# $Date: 2009-07-30 16:46:33 +0200 (Thu, 30 Jul 2009) $

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
