package Pegex::Nginx::Data;
use Pegex::Base;
extends 'Pegex::Tree';

use Data::Dumper;
use feature 'say';

#sub got_conf { $_[1][0] }
#sub got_block { +{map @$_, map @$_, @{(pop)}} }
#$VAR1 = [
#          [
#            'cock',
#            undef,
#            ' / '
#          ],
#          [
#            [
#              'cook',
#              ' ass'
#            ]
#          ]
#        ];

sub got_block { 
  +{map $_, map $_, @{(pop)}}
}
1;
