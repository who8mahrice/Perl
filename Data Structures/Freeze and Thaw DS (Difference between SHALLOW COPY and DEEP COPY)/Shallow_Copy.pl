#!/usr/bin/perl 
use warnings;
use Data::Dumper;
use Storable qw(freeze thaw);

my @provisions = qw( hat suncreen );
my @science_kit = qw( microscope radio );
push @provisions, \@science_kit;
# @packed is still pointing to @provisions elements...not a separate copy...hence it is called  a shallow copy
my @packed = @provisions

push @packed, 'blue_shirt';

push @{ $packed[2] }, 'batteries';

print Data::Dumper->Dump(
	[\@provisions],
	[ qw( *provisions )]
);

print Data::Dumper->Dump(
[ \@packed ],
[ qw( *packed ) ]
);