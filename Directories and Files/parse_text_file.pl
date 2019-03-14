# Parses data from filename.txt and sorts it by highest to lowest bytes value
# Data is stored in a Hash of Hash.
# See Intermediate Perl book pg 319 for more information
#!/usr/bin/perl 
use Data::Dumper;
use warnings;



my $file_name = "filename.txt";
open(FH, "<", $file_name);


my $all = "**all**";
my %total_bytes;
while(<FH>){
	next if (/^#/); # skips lines beginning with comments
	my ($source, $destination, $bytes) = split;
	$total_bytes{$source}{$destination} += $bytes;
	# Creates a hash name element below to store the total bytes.
	$total_bytes{$source}{$all} +=$bytes;
}

# Sorts by source that has the highest bytes to lowest bytes
my @sources = sort { $total_bytes{$b}{$all} <=> $total_bytes{$a}{$all} } keys %total_bytes;


for my $source (@sources) {
	my @destinations = sort { $total_bytes{$source}{$b} <=> $total_bytes{$source}{$a} } keys %{ $total_bytes{$source} };
	print "$source: $total_bytes{$source}{$all} total bytes sent\n";
	for my $destination (@destinations) {
		next if $destination eq $all;
		print " $source => $destination:", "$total_bytes{$source}{$destination} bytes \n";
	}
	print "\n";
}

=being

# filename.txt:
professor.hut gilligan.crew.hut 1250
professor.hut lovey.howell.hut 910
thurston.howell.hut lovey.howell.hut 1250
professor.hut lovey.howell.hut 450
professor.hut laser3.copyroom.hut 2924
ginger.girl.hut professor.hut 1218
ginger.girl.hut maryann.girl.hut 199

=cut


# Section below loops through and gets all the bytes of the hash
# for my $source (keys %total_bytes){
# 	for my $destination (keys %{$total_bytes{$source}}){
# 		print $total_bytes{$source}{$destination},"\n";
# 		}
# 	}

