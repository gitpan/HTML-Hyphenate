package HTML::Hyphenate::TypeDef;    # -*- cperl; cperl-indent-level: 4 -*-
use strict;
use warnings;

## no critic qw(ProhibitLongLines)
# $Id: TypeDef.pm 35 2008-12-07 07:53:05Z roland $
# $Revision: 35 $
# $HeadURL: svn+ssh://ipenburg.xs4all.nl/srv/svnroot/debbie/trunk/Date-Extract-P800Picture/lib/Date/Extract/P800Picture/TypeDef.pm $
# $Date: 2008-12-07 08:53:05 +0100 (Sun, 07 Dec 2008) $
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

HTML::Hyphenate::TypeDef - class for defining
a L<TeX::Hyphen> property.

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
L<TeX::Hyphen> class as property of a L<Class::Meta> defined class.

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

=cut
