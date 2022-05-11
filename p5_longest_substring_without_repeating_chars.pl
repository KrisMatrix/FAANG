#!/usr/bin/perl
use warnings;
use strict;
use experimental 'signatures';

=pod

=head1 PROBLEM 5

Given a string, find the length of the longest substring without repeating 
characters.

=head2 CONSTRAINTS

1. In the substring contiguous?
Answer: Look for a substring not a subsequence.
Consider string "abcbbd". Here, abc is a substring and abcd is a subsequence.

2. Does case sensitivity matter?
Answer: no. Assume all characters in string are lowercase.

=head2 TEST CASES

'abccabb' --> 3

'cccccc' --> 1

'' --> 0

'abcbda' --> 4

=cut

sub longest_substring_length($string) {
  my @string = split(//, $string);
}

__END__

with any string, i think we will need a start index and moving index.
Let's call that sidx and midx.

0123456
abccabb
s  m        = length 3

abccabb
   s  m     = length 3

ccccccc
sm          = length 1   m - s

abbbcadaaabcaa
   s   m
