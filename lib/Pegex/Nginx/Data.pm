package Pegex::Nginx::Data;
use Pegex::Base;
extends 'Pegex::Tree';

use Data::Dumper;

#sub got_assignment { shift; print Dumper \@_; }
sub got_block { shift; print Dumper \@_; }

1;
