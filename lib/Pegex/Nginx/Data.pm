package Pegex::Nginx::Data;
use Pegex::Base;
extends 'Pegex::Tree';

use Data::Dumper;
use XXX;
use feature 'say';

sub got_comment { return; }
sub got_blank_line { return; }

sub got_block {
    my $block = pop;
    #print Dumper $block;
    #return { $block->[0]->[0] => $block->[1] };
    #print Dumper $block;
    #my $return->{$block->[0]->[0]} = {
    #  directive => $block->[0]->[0],
    #  modifier  => $block->[0]->[1],
    #  value     => $block->[0]->[2]
    #};
    #$return->{$block->[0]->[0]}->{options} = $block->[1]->[0];
}
sub got_assignment {
    my $assignment = pop;
    my %return;
    return $return{$assignment->[0]} = $assignment->[1]->[0];
}

sub got_lua_word {
    my $self = shift;
    return $_[0];
}

sub got_lua_string {
    my $self = shift;
    #YYY { lua_string => \@_ };
    return;
}

sub got_lua {
    my $self = shift;
    #YYY { lua => \@_ };
    return;
}

sub got_value {
    my $self = shift;
    #YYY \@_;
    return @_;
}

#sub got_block { 
#  +{ map ref $_ eq 'Pegex::Nginx::Data' ? $_[1]->[0]->[0] : $_, @_ }
#}
1;
