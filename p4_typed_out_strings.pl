#!/usr/bin/perl
use warnings;
use strict;
use experimental 'signatures';

=pod

=head1 PROBLEM 4

Given two strings S and T, return if they equal when both are typed out. Any 
'#' that appears in the string counts as backspace.

=head2 CONSTRAINTS

1. What happens when two #'s appear beside each other?
Answer: Delete the two values before the first #.

2. What happens to # when there is no character to remove?
Answer: It deletes nothing then, just like a backspace would.

3. Are two empty strings equal to each other?
Answer: Yes.

4. Does the case sensitivity matter?
Answer: Yes.

=head2 TEST CASES

S: ab#z    T: az#z  --> True

S: abc#d   T: acc#c --> False

S: x#y#z#  T: a# --> True

S: a###b   T: b --> True

S: Ab#z    T: ab#z --> False

=head2 OPTIMIZE

Can you optimize space complexity of O(A+B)?
Hint 1: Utilize the original strings?
Hint 2: Use the 2 pointer technique
Hint 3: Start from the end of the strings!

=cut

sub parse_string($string) {
  # Create two arrays called @str and @new_str.
  my (@str, @new_str);        #Using two arrays

  # We have a string, let's convert to array format in @str.
  @str = split(//, $string);
  
  # Now that we have a @str, we have indices, Whenever we see a non-hash 
  # character, we copy from @str[$i] to @new_str. If we see a hash,
  # then pop from @new_str for the last value. If there is nothing in
  # @new_str, then just ignore the hash.
  foreach my $char (@str) {         #O(n) where n is length of string.
    if ($char ne '#') {
      push(@new_str, $char);
    }
    else {
      if ($#new_str > -1) {
        pop(@new_str);
      }
    }
  }

  $string = join("", @new_str);
  return $string;
}

sub typed_out_strings($s, $t) {       #O(n) but the n comes from parse_string
  print "Comparing $s and $t:\n";
  return parse_string($s) eq parse_string($t) ? "True" : "False";        #O(n)
  $t = parse_string($t);
}

print "\nSIMPLE SOLUTION:\n";
print typed_out_strings("ab#z", "az#z"),"\n";
print typed_out_strings("abc#d", "acc#c"),"\n";
print typed_out_strings("x#y#z#", "a#"),"\n";
print typed_out_strings("a###b", "b"),"\n";
print typed_out_strings("Ab#z", "ab#z"),"\n";

my $backspaceCompare = sub($s, $t) {
  print "Comparing $s and $t:\n";
  my @s = split(//, $s);
  my @t = split(//, $t);
  my $p1 = $#s;
  my $p2 = $#t;

  while ($p1 >= 0 || $p2 > 0) {
    if ($s[$p1] eq '#' || $t[$p2] eq '#') {
      if ($s[$p1] eq '#') {
        my $backCount = 2;

        while ($backCount > 0 ) {
          $p1--;
          $backCount--;

          if (defined $s[$p1] and $s[$p1] eq '#') {
            $backCount += 2;
          }
        }
      }

      if ($t[$p2] eq '#') {
        my $backCount = 2;

        while ($backCount > 0) {
          $p2--;
          $backCount--;

          if (defined $t[$p2] and $t[$p2] eq '#') {
            $backCount += 2;
          }
        }
      }
    } else {
      if ($s[$p1] ne $t[$p2]) {
        return "False";
      }
      else {
        $p1--;
        $p2--;
      }
    }
  }
  return "True";
};

print "\nOPTIMIZED SOLUTION:\n";
print &$backspaceCompare("ab#z","az#z"),"\n";
print &$backspaceCompare("abc#d","acc#c"),"\n";
print &$backspaceCompare("x#y#z#","a#"),"\n";
print &$backspaceCompare("a###b","b"),"\n";
print &$backspaceCompare("Ab#z","ab#z"),"\n";

#EOF
