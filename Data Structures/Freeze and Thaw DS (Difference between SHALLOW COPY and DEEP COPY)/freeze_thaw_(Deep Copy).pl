# From Intermediate Perl Book pg 84
#!/usr/bin/perl 
use warnings;
use Data::Dumper;
use Storable qw(freeze thaw);

my @provisions = qw( hat suncreen );
my @science_kit = qw( microscope radio );
push @provisions, \@science_kit;

my $frozen = freeze \@provisions;
my @packed = @{ thaw $frozen };

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