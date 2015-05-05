package Pegex::Nginx::Grammar;
use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'pgx/nginx.pgx';

sub make_tree {   # Generated/Inlined by Pegex::Grammar (0.60)
  {
    '+grammar' => 'nginx',
    '+toprule' => 'alllines',
    '+version' => '0.0.1',
    'alllines' => {
      '+min' => 0,
      '.ref' => 'lines'
    },
    'assignment' => {
      '.rgx' => qr/\G[\w\/]+(\s*[^\{\}\;\,]+)*;.*\r?\n?/
    },
    'blanks' => {
      '.rgx' => qr/\G\s*\r?\n/
    },
    'block' => {
      '.rgx' => qr/\G\s*(([\w\/]+(\s*=|\~\*|\~|\^\~\s*[^\{\}\;\,]+)*)\s*\{\s*(([\w\/]+(\s*[^\{\}\;\,]+)*;.*\r?\n?))*\s*\}\s*)\s*/
    },
    'comment' => {
      '.rgx' => qr/\G\#.*\r?\n?/
    },
    'lines' => {
      '.any' => [
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
    'script' => {
      '+min' => 1,
      '.any' => [
        {
          '.ref' => 'assignment'
        },
        {
          '.ref' => 'block'
        }
      ]
    }
  }
}
1;
