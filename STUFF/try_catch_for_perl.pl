#!/usr/bin/perl
# Created a try catch block since perl doesnt have one like C
# the sub try takes a anonymous subroutine and eval its

sub try (&) {
	my $code = shift;
	eval { &$code };
	if($@) {
		print "Error: $@";
	}
}

try {
	$operand1 = 1;
	$operand2 = 0;
	$result = $operand1/$operand2;
};
