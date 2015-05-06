package Pegex::Nginx::Grammar;
use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'pgx/nginx.pgx';

sub make_tree {   # Generated/Inlined by Pegex::Grammar (0.60)
  {
    '+grammar' => 'nginx',
    '+toprule' => 'allconf',
    '+version' => '0.0.1',
    'allconf' => {
      '+min' => 0,
      '.ref' => 'conf'
    },
    'assignment' => {
      '.rgx' => qr/\G\s*([\w\/]+)([^\{\}\;\,]+)*\s*;\s*\r?\n?/
    },
    'blank_line' => {
      '.rgx' => qr/\G\s*\r?\n/
    },
    'block' => {
      '.rgx' => qr/\G\s*([\w\/]+)(=|\~\*|\~|\^\~)*([^\{\}\;\,]+)*\s*\{\s*\r?\n?/
    },
    'comment' => {
      '.any' => [
        {
          '.rgx' => qr/\G\s*\#.*\r?\n/
        },
        {
          '.ref' => 'blank_line'
        }
      ]
    },
    'conf' => {
      '.any' => [
        {
          '.ref' => 'script'
        },
        {
          '.ref' => 'comment'
        }
      ]
    },
    'end_block' => {
      '.rgx' => qr/\G\s*\}\s*\r?\n?/
    },
    'lua' => {
      '.rgx' => qr/\G(\s*\w+?lua[\s\S]+?)\s*;\s*\r?\n?\s*/
    },
    'script' => {
      '.any' => [
        {
          '.ref' => 'assignment'
        },
        {
          '.ref' => 'block'
        },
        {
          '.ref' => 'end_block'
        },
        {
          '.ref' => 'lua'
        }
      ]
    }
  }
}
1;
