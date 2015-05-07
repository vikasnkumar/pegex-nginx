package Pegex::Nginx;
BEGIN { $ENV{PERL_PEGEX_AUTO_COMPILE} = 'Neuadmin::Files::Nginx::Grammar' }
our $VERSION = '0.27';

use Pegex::Base;

use Pegex::Parser;
use Pegex::Nginx::Grammar;
use Pegex::Nginx::Data;

sub load {
  my ($self, $in, %args) = @_;
  Pegex::Parser->new(
    grammar  => Pegex::Nginx::Grammar->new,
    receiver => Pegex::Nginx::Data->new,
    #debug => 1,
    %args
  )->parse($in);
}

1;
