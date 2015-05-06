package Pegex::Nginx::Grammar;
use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'pgx/nginx.pgx';

sub make_tree {   # Generated/Inlined by Pegex::Grammar (0.60)
  {
    '+grammar' => 'nginx',
    '+toprule' => 'allconf',
    '+version' => '0.0.1',
    '_' => {
      '.rgx' => qr/\G\s*/
    },
    'allconf' => {
      '+min' => 0,
      '.ref' => 'conf'
    },
    'anonymous_block' => {
      '.all' => [
        {
          '.ref' => 'start_block'
        },
        {
          '+min' => 0,
          '.any' => [
            {
              '.ref' => 'assignment'
            },
            {
              '.ref' => 'block'
            },
            {
              '.ref' => 'comment'
            }
          ]
        },
        {
          '.ref' => 'end_block'
        }
      ]
    },
    'assignment' => {
      '.rgx' => qr/\G\s*([\w\/]+)([^\{\}\;\,]+)*\s*;\s*\r?\n?/
    },
    'blank_line' => {
      '.rgx' => qr/\G\s*\r?\n/
    },
    'block' => {
      '.any' => [
        {
          '.ref' => 'named_block'
        },
        {
          '.ref' => 'unnamed_block'
        }
      ]
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
    'key' => {
      '.rgx' => qr/\G[\w\/]+/
    },
    'modifier' => {
      '.rgx' => qr/\G=|\~\*|\~|\^\~/
    },
    'named_block' => {
      '.all' => [
        {
          '.ref' => 'key'
        },
        {
          '+min' => 0,
          '.ref' => 'modifier'
        },
        {
          '.ref' => 'value'
        },
        {
          '.ref' => 'anonymous_block'
        }
      ]
    },
    'script' => {
      '.all' => [
        {
          '.ref' => '_'
        },
        {
          '+min' => 1,
          '.any' => [
            {
              '.ref' => 'assignment'
            },
            {
              '.ref' => 'block'
            }
          ]
        },
        {
          '.ref' => '_'
        }
      ]
    },
    'start_block' => {
      '.rgx' => qr/\G\s*\{\s*\r?\n?/
    },
    'unnamed_block' => {
      '.all' => [
        {
          '.ref' => 'key'
        },
        {
          '.ref' => 'anonymous_block'
        }
      ]
    },
    'value' => {
      '.rgx' => qr/\G[^\{\}\;\,]+/
    }
  }
}
1;
