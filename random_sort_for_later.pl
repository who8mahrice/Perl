#------------------------------------------------------------------------

=begin
# Intermediate Perl pg 96 (Subroutine Reference)
# When a person enters a room the person already in the room says Hi
# and the person who just entered the room says Hi back

#!/usr/bin/perl 
use warnings;
use Data::Dumper;

#Uses a Hash with subroutine references as values.
my %greets = (
	Skipper => sub {
		my $person = shift;
		print "Skipper: Hey there, $person!\n";
	},
	Gilligan => sub {
	my $person = shift;
	if ($person eq 'Skipper') {
		print "Gilligan: Sir, yes, sir, $person!\n";
	} else {
		print "Gilligan: Hi, $person!\n";
	}
	},
	Professor => sub {
		my $person = shift;
		print "Professor: By my calculations, you must be $person!\n";
	},
	Ginger => sub {
		my $person = shift;
		print "Ginger: (in a sultry voice) Well hello, $person!\n";
	},
);

my @room; # initially empty
for my $person (qw(Gilligan Skipper Professor Ginger)) {
	print "\n";
	print "$person walks into the room.\n";
	for my $room_person (@room) {
		$greets{$person}->($room_person); # speaks
		$greets{$room_person}->($person); # gets reply
	}
	push @room, $person; # come in, get comfy
}
=cut

#------------------------------------------------------------------------

=begin
# From Intermediate Perl Book pg 89
# Using a map and inner map to make anonoymous arrays


# The keys of %provisions are names of the people. For each name, we construct a twoelement list comprising the name and the corresponding provisions array reference.
# This list is inside an anonymous array constructor, so we get back a reference to a newly
# created array for each person. Three names in; three references out. Or, we can go a
# different way. We turn the input hash into a series of references to arrays. Each array
# will have a person’s name and one of the items they brought:

# Yes, a map within a map. The outer map selects one person at a time. We save this name
# in $person, and then we extract the item list from the hash. The inner map walks over
# this item list, executing the expression to construct an anonymous array reference for
# each item. The anonymous array contains the person’s name and the provision item.
# We had to use $person here to hold the outer $_ temporarily. Otherwise, we can’t refer
# to both temporary values for the outer map and the inner map.

#!/usr/bin/perl 
use warnings;
use Data::Dumper;

my %provisions = (
'The Skipper' => [qw(blue_shirt hat jacket preserver sunscreen) ],
'The Professor' => [qw(sunscreen water_bottle slide_rule batteries radio) ],
'Gilligan' => [qw(red_shirt hat lucky_socks water_bottle) ],
);

my @person_item_pairs = map {
	my $person = $_;
	my @items = @{ $provisions{$person} };
	map [$person => $_], @items;
} keys %provisions;

print Dumper \@person_item_pairs;

#------------------------------------------------------------------------
=cut

=begin
# From Intermediate Perl Book pg 89
#!/usr/bin/perl 
use warnings;
use Data::Dumper;

my %provisions = (
'The Skipper' => [qw(blue_shirt hat jacket preserver sunscreen) ],
'The Professor' => [qw(sunscreen water_bottle slide_rule batteries radio) ],
'Gilligan' => [qw(red_shirt hat lucky_socks water_bottle) ],
);

# Gets the hash key (Name) with a value array of less than 5 items/elements
my @packed_light = grep @{ $provisions{$_} } < 5 , keys %provisions;

print join(", ", @packed_light)."\n";


# Uses grep to filter results of an array
my @all_wet = grep {
	my @items = @{ $provisions{$_} };
	grep $_ eq 'water_bottle', @items;
} keys %provisions;

print join(", ", @all_wet);
=cut


