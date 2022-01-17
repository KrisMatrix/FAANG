#!/usr/bin/perl
use warnings;
use strict;
use experimental 'signatures';
use List::Util qw(min max);

###############################################################################
#Trapping Rainwater
#
#Problem: Given an array of integers representing an elevation map where the 
# width of each bar is 1, return how much rain water can be trapped.
#
# Constraints: 1. Only the datapoints provided in the input array can be part 
#                 of the wall. The coordinates of a graph don't form the wall.
#              2. All numbers are positive.
#
# Given: 1. An array of positive numbers.
#
# Return: total trapped rain water
###############################################################################

sub get_trapped_rainwater_simple(@heights) { #O(n^2) time complexity
                                             #O(n) space complexity
  my $total_water = 0;      #the return value

  #O(n)
  for (my $p = 0; $p <= $#heights; $p++) {  # select a pointer p that will
                                            # start at coordinate 0,0 and 
                                            # move along x-axis.
                                              
    my $left_p = $p;       # another pointer, that moves to the left of p
                          # along the x-axis
    my $right_p = $p;      # another pointer, that moves to the right of p
                          # along the y-axis
                            
    my $max_left = 0;     # keeps track of the max value to the left of p
    my $max_right = 0;    # keeps track of the max value to the right of p

    while($left_p >= 0) {     #O(n)
      $max_left = max($max_left, $heights[$left_p]);
      $left_p--;
    }

    while($right_p <= $#heights) { #O(n)
      $max_right = max($max_right, $heights[$right_p]);
      $right_p++;
    }

    my $current_water = min($max_left, $max_right) - $heights[$p];

    if ($current_water >= 0) {
      $total_water += $current_water;
    }
  }
  return $total_water;
}

sub get_trapped_rainwater_optimal(@heights) {
  my $left = 0;
  my $right = $#heights;
  my $total_water = 0;
  my $max_left = 0;
  my $max_right = 0;

  while ($left < $right) {
    if ($heights[$left] <= $heights[$right]) {
      if ($heights[$left] >= $max_left) {
        $max_left = $heights[$left];
      }
      else {
        $total_water += $max_left - $heights[$left];
      }
      $left++;
    }
    else {
      if ($heights[$right] >= $max_right) {
        $max_right = $heights[$right];
      }
      else {
        $total_water += $max_right - $heights[$right];
      }
      $right--;
    }
  }
  return $total_water;
}
my @heights = qw(0 1 0 2 1 0 3 1 0 1 2);  #correct answer is 8.
my @heights1 = qw(); #correct answier is 0.
my @heights2 = qw(3); #correct answier is 0.
my @heights3 = qw(3 4 3); #correct answier is 0.

print "Result = ",get_trapped_rainwater_simple(@heights), "\n";
print "Result = ",get_trapped_rainwater_simple(@heights1), "\n";
print "Result = ",get_trapped_rainwater_simple(@heights2), "\n";
print "Result = ",get_trapped_rainwater_simple(@heights3), "\n";


print "Result = ",get_trapped_rainwater_optimal(@heights), "\n";
print "Result = ",get_trapped_rainwater_optimal(@heights1), "\n";
print "Result = ",get_trapped_rainwater_optimal(@heights2), "\n";
print "Result = ",get_trapped_rainwater_optimal(@heights3), "\n";
