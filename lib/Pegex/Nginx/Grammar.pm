package Pegex::Nginx::Grammar;
use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'pgx/nginx.pgx';

sub make_tree {   # Generated/Inlined by Pegex::Grammar (0.60)
  {
    '+grammar' => 'opsboy',
    '+toprule' => 'alllines',
    '+version' => '0.0.1',
    '_' => {
      '.rgx' => qr/\G\s*/
    },
    'alllines' => {
      '+min' => 0,
      '.ref' => 'lines'
    },
    'assignment' => {
      '.all' => [
        {
          '.ref' => 'key'
        },
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'value'
        },
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'terminator'
        }
      ]
    },
    'blanks' => {
      '.rgx' => qr/\G\s*\r?\n/
    },
    'block' => {
      '.all' => [
        {
          '.all' => [
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
              '.ref' => 'value'
            }
          ]
        },
        {
          '.rgx' => qr/\G\s*\{/
        },
        {
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
          '.rgx' => qr/\G\s*\}/
        }
      ]
    },
    'comment' => {
      '.rgx' => qr/\G\#.*\r?\n/
    },
    'key' => {
      '.rgx' => qr/\G([\w\/]+)/
    },
    'lines' => {
      '.any' => [
        {
          '.ref' => 'assignment'
        },
        {
          '.ref' => 'block'
        },
        {
          '.ref' => 'script'
        },
        {
          '.ref' => 'comment'
        },
        {
          '.ref' => 'blanks'
        }
      ]
    },
    'modifier' => {
      '.rgx' => qr/\G=|\~\*|\~|\^\~/
    },
    'script' => {
      '.any' => [
        {
          '.ref' => 'assignment'
        },
        {
          '.ref' => 'block'
        }
      ]
    },
    'terminator' => {
      '.rgx' => qr/\G;\s*/
    },
    'value' => {
      '.rgx' => qr/\G([^\{\}\;\,]+)/
    }
  }
}
1;
