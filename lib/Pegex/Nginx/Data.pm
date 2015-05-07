package Pegex::Nginx::Data;
use Pegex::Base;
extends 'Pegex::Tree';

use Data::Dumper;
use feature 'say';

sub got_block { 
  +{ map ref $_ eq 'Pegex::Nginx::Data' ? $_[1]->[0]->[0] : $_, @_ }
}
1;
