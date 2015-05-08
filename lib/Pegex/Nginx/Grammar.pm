package Pegex::Nginx::Grammar;
use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'pgx/nginx.pgx';

sub make_tree {   # Generated/Inlined by Pegex::Grammar (0.60)
  {
    '+grammar' => 'nginx',
    '+toprule' => 'conf',
    '+version' => '0.0.1',
    '_' => {
      '.rgx' => qr/\G\s*/
    },
    'assignment' => {
      '.all' => [
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'key'
        },
        {
          '.ref' => '_'
        },
        {
          '+min' => 1,
          '.ref' => 'param'
        },
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'line_ending'
        }
      ]
    },
    'blank_line' => {
      '.rgx' => qr/\G\s*\r?\n/
    },
    'block' => {
      '.all' => [
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'block_head'
        },
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'block_start'
        },
        {
          '.ref' => '_'
        },
        {
          '+min' => 0,
          '.ref' => 'value'
        },
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'block_end'
        },
        {
          '.ref' => '_'
        }
      ]
    },
    'block_end' => {
      '.rgx' => qr/\G\s*\}\s*\r?\n?/
    },
    'block_head' => {
      '.all' => [
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'key'
        },
        {
          '.ref' => '_'
        },
        {
          '+min' => 0,
          '.ref' => 'modifier'
        },
        {
          '.ref' => '_'
        },
        {
          '+min' => 0,
          '.ref' => 'directive'
        },
        {
          '.ref' => '_'
        }
      ]
    },
    'block_start' => {
      '.rgx' => qr/\G\s*\{\s*\r?\n?/
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
      '+min' => 0,
      '.ref' => 'value'
    },
    'directive' => {
      '.rgx' => qr/\G([^\}\{;,\s]+)/
    },
    'key' => {
      '.rgx' => qr/\G([\w\/]+)/
    },
    'line_ending' => {
      '.rgx' => qr/\G\s*;\s*\r?\n?/
    },
    'lua' => {
      '.all' => [
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'lua_word'
        },
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'lua_string'
        },
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'line_ending'
        },
        {
          '.ref' => '_'
        }
      ]
    },
    'lua_string' => {
      '.rgx' => qr/\G(?:'((?:[^\\']|\\'|\\\\)*?)')/
    },
    'lua_word' => {
      '.rgx' => qr/\G(\w*lua)/
    },
    'modifier' => {
      '.rgx' => qr/\G(=|\~\*|\~|\^\~)/
    },
    'param' => {
      '.rgx' => qr/\G([^\}\{;,]+)/
    },
    'value' => {
      '.any' => [
        {
          '.ref' => 'block'
        },
        {
          '.ref' => 'assignment'
        },
        {
          '.ref' => 'comment'
        },
        {
          '.ref' => 'lua'
        }
      ]
    }
  }
}
1;
