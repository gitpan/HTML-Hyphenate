#!/sw/bin/perl -w    # -*- cperl; cperl-indent-level: 4 -*-
use strict;
use warnings;

## no critic qw(ProhibitLongLines)
# $Id: P800Picture.pm 50 2009-01-31 09:22:52Z roland $
# $Revision: 50 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/debbie/trunk/Date-Extract-P800Picture/lib/Date/Extract/P800Picture.pm$
# $Date: 2009-01-31 10:22:52 +0100 (Sat, 31 Jan 2009) $
## use critic

use 5.006000;
use utf8;

our $VERSION = '0.01';

# Copyright 2009 Roland van Ipenburg

use Encode qw(decode_utf8);
use HTML::Hyphenate;

use File::Slurp qw(read_file);
use Readonly;
## no critic qw(ProhibitCallsToUnexportedSubs)
Readonly::Scalar my $EMPTY  => q{};
Readonly::Scalar my $MIN_LENGTH  => 5;
## use critic

my $hyphenator = HTML::Hyphenate->new();
$hyphenator->min_length($MIN_LENGTH);

while ( my $filename = shift @ARGV ) {
    my $html = read_file( $filename, binmode => ':utf8' );
	$html = decode_utf8 $html;
	binmode STDOUT, ':utf8';
	my ($pre, $body, $post) = $html =~ m{^(.*<body>)(.*)(</body>.*)$}xmgis;
	## no critic qw(RequireCheckedSyscalls)
	print $pre, $hyphenator->hyphenated($body), $post;
	## use critic
}
