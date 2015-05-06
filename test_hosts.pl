#!/usr/bin/env perl
use strict;
use Pegex::Parser;
use lib 'lib';
use Pegex::Nginx::Grammar;
use Data::Dumper;
use feature 'state';

my $ass;
{
    package Pegex::Nginx::AST;
    use base 'Pegex::Tree';
    use Data::Dumper;
    
    state $directive;
    
    sub got_assignment {
      my ($self,$list) = @_;
      if ( $directive ne '' ) {
        $ass->{$directive}->{assignments}->{$list->[0]} = $list->[1];
      }
      else {
        $ass->{top_level}->{$list->[0]} = $list->[1];
      }
    }
    sub got_lua {
      my ($self,$list) = @_;
      print Dumper $list;
    }
    sub got_block {
      my ($self,$list) = @_;
      $directive = $list->[0];
      $ass->{$directive}->{modifier} = $list->[1];
      $ass->{$directive}->{value} = $list->[2];
    }

}

my $infile = shift or
    die "No input file specified.\n";

open my $in, $infile or
    die "Cannot open $infile for reading: $!\n";

my $src = do { local $/; <$in> };

my $ast = Pegex::Parser->new(
  grammar  => Pegex::Nginx::Grammar->new,
  receiver => Pegex::Nginx::AST->new,
#  debug => 1,
)->parse($src);

#print Dumper $ass;
