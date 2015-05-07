package Pegex::Nginx::Grammar;
use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'pgx/nginx.pgx';

sub make_tree {   # Generated/Inlined by Pegex::Grammar (0.60)
  {
    '+grammar' => 'nginx',
    '+toprule' => 'conf',
    '+version' => '0.0.1',
    'assignment' => {
      '.rgx' => qr/\G\s*([\w\/]+)([^\}\{;,]+)*\s*;\s*\r?\n?/
    },
    'block' => {
      '.all' => [
        {
          '.rgx' => qr/\G\s*([\w\/]+)(=|\~\*|\~|\^\~)*([^\}\{;,]+)*\s*\{\s*\r?\n?/
        },
        {
          '+min' => 0,
          '.ref' => 'value'
        },
        {
          '.rgx' => qr/\G\s*\s*\}\s*\r?\n?/
        }
      ]
    },
    'comment' => {
      '.rgx' => qr/\G\s*\#.*\r?\n/
    },
    'conf' => {
      '+min' => 0,
      '.ref' => 'value'
    },
    'lua' => {
      '.rgx' => qr/\G\s*(\w+?lua)([\s\S]+?)\s*;\s*\r?\n?/
    },
    'value' => {
      '.any' => [
        {
          '.ref' => 'block'
        },
        {
          '.ref' => 'lua'
        },
        {
          '.ref' => 'assignment'
        },
        {
          '.ref' => 'comment'
        }
      ]
    }
  }
}
1;
