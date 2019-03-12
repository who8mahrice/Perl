sub sub1 {
	$text = shift;
	print "$text there!\n";
}

sub sub2 {
	$text = shift;
	print "$text everyone!\n";
}

sub1("Hello");

*sub1 = \&sub2;

sub1("Hi");

# Hello there!
# Hi everyone!
