

# PASSING BY REFERENCE (Preferred Way): Compares an array and a hash to see if there are any missing 
# required items (array) that is needed in the hash. AND adds a list of required items to items list
sub check_required_items {
my $who = shift;
my $items = shift;
my %whose_items = map { $_, 1 } @$items;

my @required = qw(preserver sunscreen water_bottle jacket);
my @missing = ( );

for my $item (@required) {
	unless ( $whose_items{$item} ) { # not found in list?
		print "$who is missing $item.\n";
		push @missing, $item;
 }
}

if (@missing) {
	print "Adding @missing to @$items for $who.\n";
		push @$items, @missing;
 }
}

my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @skipper_with_name = ('Skipper' => \@skipper);

my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @professor_with_name = ('Professor' => \@professor);

my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
my @gilligan_with_name = ('Gilligan' => \@gilligan);

my @all_with_names = (
	\@skipper_with_name,
	\@professor_with_name,
	\@gilligan_with_name,
);

for my $person (@all_with_names) {
	my $who = $$person[0];
	my $provisions_reference = $$person[1];
	check_required_items($who, $provisions_reference);
}

#----------------------------------------------------------------------------------------------------

# PASSING BY REFERENCE (Preferred Way): Compares an array and a hash to see if there are any missing 
# required items (array) that is needed in the hash.
sub check_required_items {
my $who = shift;
my $items = shift;
my %whos_items = map { $_, 1 } @{$items}; # the rest are the person's items

my @required = qw(preserver sunscreen water_bottle jacket);

for my $item (@required) {
	unless ( $whos_items{$item} ) { # not found in list?
		print "$who is missing $item.\n";
	}
  }
}

my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
check_required_items('gilligan', \@gilligan);

my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
check_required_items('skipper', \@skipper);

my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
check_required_items('professor', \@professor);

#----------------------------------------------------------------------------------------------------

# PASSING BY VALUE: Compares an array and a hash to see if there are any missing 
# required items (array) that is needed in the hash.
sub check_required_items {
my $who = shift;
my %whos_items = map { $_, 1 } @_; # the rest are the person's items

my @required = qw(preserver sunscreen water_bottle jacket);

for my $item (@required) {
	unless ( $whos_items{$item} ) { # not found in list?
		print "$who is missing $item.\n";
	}
  }
}

my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
check_required_items('gilligan', @gilligan);

my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
check_required_items('skipper', @skipper);
check_required_items('professor', @professor);
