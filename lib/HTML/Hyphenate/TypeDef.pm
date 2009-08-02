package HTML::Hyphenate::TypeDef;    # -*- cperl; cperl-indent-level: 4 -*-
use strict;
use warnings;

## no critic qw(ProhibitLongLines)
# $Id: TypeDef.pm 109 2009-07-31 01:30:29Z roland $
# $Revision: 109 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/elaine/trunk/HTML-Hyphenate/lib/HTML/Hyphenate/TypeDef.pm $
# $Date: 2009-07-31 03:30:29 +0200 (Fri, 31 Jul 2009) $
## use critic

use 5.006000;
use utf8;

our $VERSION = '0.01';

use Class::Meta::Type;

my $type_hyphen = Class::Meta::Type->add(
    key  => 'hyphen',
    desc => 'TeX::Hyphen object',
    name => 'TeX::Hyphen Object',
);

my $type_tree = Class::Meta::Type->add(
    key  => 'tree',
    desc => 'HTML::TreeBuilder object',
    name => 'HTML::TreeBuilder Object',
);

1;

__END__

=encoding utf8

=head1 NAME

HTML::Hyphenate::TypeDef - class for defining a L<TeX::Hyphen> and a
L<HTML::TreeBuilder> property.

=head1 VERSION

=head1 SYNOPSIS

	use Class::Meta::Express;
	use HTML::Hyphenate::TypeDef;

	class {
		has hyphen	=> (
			is 		=> 'hyphen',
			default => sub { TeX::Hyphen->new() },
		);
	};

=head1 DESCRIPTION

The B<HTML::Hyphenate:TypeDef> module makes it possible to use a
L<TeX::Hyphen> class and a L<HTML::TreeBuilder> as property of a
L<Class::Meta> defined class.

=head1 SUBROUTINES/METHODS

=head1 CONFIGURATION AND ENVIRONMENT

=head1 DEPENDENCIES

=head1 INCOMPATIBILITIES

=head1 DIAGNOSTICS

=head1 BUGS AND LIMITATIONS

=head1 AUTHOR

Roland van Ipenburg, E<lt>ipenburg@xs4all.nlE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2009 by Roland van Ipenburg

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENSE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

=cut