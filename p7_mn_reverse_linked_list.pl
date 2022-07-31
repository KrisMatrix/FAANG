#!/usr/bin/perl
use warnings;
use strict;
use experimental "signatures";

=pod

=head1 PROBLEM

  Given a linked list and numbers 'm' and 'n', return
  it back with only positions between and inclusive of
  m and n in reverse.

  Given: 1 -> 2 -> 3 -> 4 -> 5  
  m = 2 and n = 4
  Ans:   1 -> 4 -> 3 -> 2 -> 5

=head2 CONSTRAINTS

  Will m and n always be within the bounds of the linked list?

  Yes, assume 1 <= m <= n <= length of linked list.

  Can we receive m and n values for the whole linked list?

  Yes, we can receive m=1 and n=length of linked list.

=head2 TEST CASE

  Given: 1 -> 2 -> 3 -> 4 -> 5  
  m = 2 and n = 4
  Ans:   1 -> 4 -> 3 -> 2 -> 5

  
  Given: 1 -> 2 -> 3 -> 4 -> 5  
  m = 1 and n = 5
  Ans:   5 -> 4 -> 3 -> 2 -> 1

  Given: 1
  m = 1 and n = 1
  Ans:   1

  Given: null
  m = 0 and n = 0
  AnsL   null

=cut

package Node {
  sub new {
    my ($class, $data) = @_;
    my $self = {
      data => $data,
      next => undef,
      prev => undef
    };
    bless $self, $class;
    return $self;
  }
}

package LinkedList {
  sub new {
    my $class = shift;
    my $self = {
      head => undef,
      tail => undef,
      length => 0
    };
    bless $self, $class;
    return $self;
  }

  sub append($self, $data) {
    # Create a new node
    my $new_node = Node->new($data);
    # if the linkedlist is null, then assign the head
    # and tail to the new node.
    if (!defined $self->{head}) {
      $self->{head} = $new_node;
      $self->{tail} = $new_node;
      $self->{length} = 1;
    }
    # if the linked list has one or more nodes already
    # then assign new node to tail, and update tail.
    else {
      $self->{tail}->{next} = $new_node;
      $self->{tail}->{next}->{prev} = $self->{head};
      $self->{tail} = $new_node;
      $self->{length} += 1;
    }
  }

  sub print($self) {
    my $current_node = $self->{head};
    my $full_list = "";

    while (defined $current_node) {
      $full_list .= $current_node->{data}.",";
      $current_node = $current_node->{next};
    }

    chop($full_list);
    print "$full_list\n";
    print "Length = ",$self->{length},"\n";
  }

  sub mn_reversal($self, $m, $n) {
    print "$m and $n\n";
    if ($self->{length} <= 1) {
      #do nothing
    }
    else {
      my $current_node = $self->{head};
      my $node_index = 1;
      while (!defined $current_node->{next}) {
        # if m = nodeindex, then store in mnode and
        # store 
        # if n = nodeindex, then 
      }
    }
  }
}

my $ll = LinkedList->new();
$ll->append(1);
$ll->append(2);
$ll->append(3);
$ll->append(4);
$ll->append(5);
$ll->print();
$ll->mn_reversal(2,4);
$ll->print();
