#!/usr/bin/perl -w

BEGIN {
    if( $ENV{PERL_CORE} ) {
        chdir 't' if -d 't';
        @INC = ('../lib', 'lib');
    }
    else {
        unshift @INC, 't/lib';
    }
}

use strict;
use Test::More;

if( $^O eq 'VMS' ) {
    plan skip_all => 'prefixify works differently on VMS';
}
else {
    plan tests => 3;
}
use ExtUtils::MakeMaker::Config;
use File::Spec;
use ExtUtils::MM;

my $Is_Dosish = $^O =~ /^(dos|MSWin32)$/;

my $mm = bless {}, 'MM';

my $default = File::Spec->catdir(qw(this that));

$mm->prefixify('installbin', 'wibble', 'something', $default);
is( $mm->{INSTALLBIN}, $Config{installbin},
                                            'prefixify w/defaults');

$mm->{ARGS}{PREFIX} = 'foo';
$mm->prefixify('installbin', 'wibble', 'something', $default);
is( $mm->{INSTALLBIN}, File::Spec->catdir('something', $default),
                                            'prefixify w/defaults and PREFIX');

SKIP: {
    skip "Test for DOSish prefixification", 1 unless $Is_Dosish;

    $Config{wibble} = 'C:\opt\perl\wibble';
    $mm->prefixify('wibble', 'C:\opt\perl', 'C:\yarrow');

    is( $mm->{WIBBLE}, 'C:\yarrow\wibble',  'prefixify Win32 paths' );
}
