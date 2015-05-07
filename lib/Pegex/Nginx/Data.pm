package Pegex::Nginx::Data;
use Pegex::Base;
extends 'Pegex::Tree';

use Data::Dumper;
use XXX;
use feature 'say';

sub got_comment { return; }
sub got_blank_line { return; }

sub got_assignment {
    my $self = shift;
    YYY { assignment => \@_ };
    return @_;
}

sub got_lua_word {
    my $self = shift;
    YYY {lua_word => \@_};
    return;
}

sub got_lua_string {
    my $self = shift;
    YYY { lua_string => \@_ };
    return;
}

sub got_lua {
    my $self = shift;
    YYY { lua => \@_ };
    return;
}

sub got_value {
    my $self = shift;
    YYY \@_;
    return @_;
}

#sub got_block { 
#  +{ map ref $_ eq 'Pegex::Nginx::Data' ? $_[1]->[0]->[0] : $_, @_ }
#}
1;
