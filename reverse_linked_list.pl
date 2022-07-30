#!/usr/bin/perl
use warnings;
use strict;
use experimental 'signatures';

=pod

=head1 NAME

=head2 PROBLEM

  Reverse a linked list.

  Say you are given a linked list:
    
    1 -> 2 -> 3 -> 4 -> 5

  please return:

    5 -> 4 -> 3 -> 2 -> 1

=head2 CONSTRAINTS

  What do we return if we get null or a single node?

  Simply return null and the node back respectively.

=head2 TEST CASES

  Test1:    1 -> 2 -> 3 -> 4 -> 5
  Result:   5 -> 4 -> 3 -> 2 -> 1

  Test2:    null
  Result:   null

  Test3:    3
  Resut:    3

=cut

package Node {
  # a node has the data and information about what the next node is.
  # node = (data|next)
  sub new {
    my ($class, $data) = @_;
    my $self = {
      data => $data,
      next => undef,
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

  sub append($self, $data) {  #appending a new node to linked list
    my $new_node = Node->new($data);
    if (!defined $self->{head}) { # current linked list is empty
      $self->{head} = $new_node;
      $self->{tail} = $self->{head};
      $self->{length} = 1;
    }
    else {
      $self->{tail}->{next} = $new_node;
      $self->{tail} = $new_node;
      $self->{length} += 1;
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
      print "Length = ",$self->{length},"\n"
    }
  }

  sub reverse($self) {
    my $prev = undef;
    my $temp;
    $self->{tail} = $self->{head};
    while (defined $self->{head}) {
      $temp = $self->{head};
      $self->{head} = $self->{head}->{next};
      $temp->{next} = $prev;
      $prev = $temp;
    }
    $self->{head} = $temp;
    return $self;
  }
}

print "Linked List: 1 2 3 4 5\n";
my $ll = LinkedList->new();
$ll->append(1);
$ll->append(2);
$ll->append(3);
$ll->append(4);
$ll->append(5);
$ll->print();
$ll->reverse()->print();

print "Null Linked List:\n";
my $ll2 = LinkedList->new();  #null list
$ll2->reverse()->print();

print "Linked List with only one element:\n";
my $ll3 = LinkedList->new();
$ll3->append(1);
$ll3->reverse()->print();

=pod

=head2 AUTHOR

  Krishna Karnamadakala

=cut
