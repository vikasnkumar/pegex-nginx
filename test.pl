#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper;
use YAML::Tiny qw/Load/;

my $file = shift or die "You must specify a file!";

my $yaml = YAML::Tiny->new;
my $in = $yaml->read($file);
print Dumper $in->[0];
