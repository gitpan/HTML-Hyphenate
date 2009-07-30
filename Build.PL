use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'HTML::Hyphenate',
    license             => 'perl',
    dist_author         => 'Roland van Ipenburg <ipenburg@xs4all.nl>',
    dist_version_from   => 'lib/HTML/Hyphenate.pm',
    requires => {
        'Test::More' => 0,
        'version'    => 0,
    },
    add_to_cleanup      => [ 'HTML-Hyphenate-*' ],
);

$builder->create_build_script();
