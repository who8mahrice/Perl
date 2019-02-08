#!/usr/bin/perl 
use warnings;
use strict;
use diagnostics;
use v5.28;


package CD::Music;
use strict;

sub new
{
my ($class, %arg) = @_;
	bless{
		'_name'=> $arg{'name'}|| croak("missing name"),
		'_artist'=> $arg{'artist'}|| "???",
		'_publisher'=> $arg{'publisher'}|| "???",
		'_ISBN'=> $arg{'ISBN'}|| "???",
		'_tracks'=> $arg{'tracks'}|| "???",
		'_room'=> $arg{'room'}|| "uncataloged",
		'_shelf'=> $arg{'shelf'}|| "",
		'_rating'=> $arg{'rating'}|| ask_rating($arg{'name'}),
	}, $class;
}

sub get_values {
	my $self = shift;
	#print ref($self);
	print "Name: ". $self->{_name} ."\n";
}

sub ask_rating { print "What is your rating for $_[0]? "; scalar <> }

package main;
use strict;

my $cd = CD::Music->new(name=> "Piano Concerto 20",
	artist=> "Mozart",
	rating=> 10,
	room=> 5,
	shelf=> 1,
	publisher=> "Salieri Intl.",
	ISBN=> "1426-43235624-2",
);

print "The number of keys in \$cd is: ". scalar keys %{$cd}, "\n"; # not sure why '.'' didnt work between "%{$cd}" and "\n" 
print  "The keys are: ", join(", ", keys %{$cd} ),"\n";
#direct access
print "ISBN: ". $cd->{_ISBN}."\n";
#access from class
$cd->get_values();
