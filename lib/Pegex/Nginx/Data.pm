package Pegex::Nginx::Data;
use Pegex::Base;
extends 'Pegex::Tree';

use Data::Dumper;
use XXX;
use feature qw/state say/;

sub got_comment { return; }
sub got_blank_line { return; }

sub got_modifier {
    my $self = shift;
    #YYY { modifier => \@_ };
    return @_;
}

sub got_directive {
    my $self = shift;
    #YYY { directive => \@_ };
    return @_;
}

sub got_block {
    my $block = pop;
    push @{$block->[1]}, {
      directive_modifier => $block->[0]->[1]->[0],
      directive_value    => $block->[0]->[2]->[0],
    };
    return { $block->[0]->[0] => $block->[1] };
}
sub got_assignment {
    my $assignment = pop;
    return { $assignment->[0] => $assignment->[1]->[0] };
}

sub got_lua_word {
    my $self = shift;
    return $_[0];
}

sub got_lua_string {
    my $self = shift;
    #say $_[0];
    return $_[0];
}

sub got_lua {
    my ($self, $lua) = @_;
    $self->flatten($lua) if ref $lua eq 'ARRAY';
    return { $lua->[0] => $lua->[1] };
}

sub got_value {
    my $self = shift;
    #YYY \@_;
    return @_;
}

sub final {
  my $result = pop;
  my $out = _create_structure($result);
  return $out;
}

sub _create_structure {
  my ($data, $out) = @_;

  for my $hash ( @$data ) {
    for my $key ( keys %$hash ) {
      my $val = $hash->{$key};
      if ( ! ref $val ) {
        $out->{$key} = $val;
      }
      else {
        if ( exists $out->{$key} ) {
          if ( ref $out->{$key} ne 'ARRAY' ) {
            my $temp = $out->{$key};
            undef $out->{$key};
            $out->{$key}->[0] = $temp;
          }
          push @{ $out->{$key} }, _create_structure($val);
        }
        else {
          $out->{$key} = _create_structure($val);
        }
      }
    }
  }
  return $out;
}

1;
