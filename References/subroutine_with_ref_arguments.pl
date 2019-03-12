#!/usr/bin/perl
use strict; 
use warnings;
use feature 'say'; 
use v5.10; 
use Data::Dumper;

my @row1 = ( 1, 2, 3);
my $next_val = 4;

insert(\@row1, $next_val);

print Dumper \@row1;


sub insert
{
	my ($arr_ref, $new_val) = @_;
	@{$arr_ref} = sort {$a<=>$b} (@{$arr_ref}, $new_val);# numerical sort
}
