package Pegex::Nginx;
BEGIN { $ENV{PERL_PEGEX_AUTO_COMPILE} = 'Neuadmin::Files::Nginx::Grammar' }
our $VERSION = '0.27';

use Pegex::Base;

use Pegex::Parser;
use Pegex::Nginx::Grammar;
use Pegex::Nginx::Data;

1;
