#!/usr/bin/env perl
use strict;
use lib 'lib';
use Pegex::Nginx;
use Data::Dumper;

my $infile = shift or
    die "No input file specified.\n";

open my $in, $infile or
    die "Cannot open $infile for reading: $!\n";

my $src = do { local $/; <$in> };
my $ast = Pegex::Nginx->new->load($src, debug => 0);
print Dumper $ast;
