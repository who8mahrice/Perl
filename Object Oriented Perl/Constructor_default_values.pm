package CD::Music;
use strict;
{
	my $_count = 0;
	sub get_count { $count }
	my $_incr_count = sub { ++$_count };
}

sub new {
	my ($class, %arg) = @_;
	$class->_incr_count();
	blass {
		_name		=> $arg{name}		|| croak("missing name"),
		_artist		=> $arg{artist}		|| "????",
		_publisher	=> $arg{publisher}	|| "????",
		_ISBN		=> $arg{ISBN}		|| "????",
		_tracks		=> $arg{tracks}		|| "????",
		_room		=> $arg{room}		|| "uncataloged",
		_shelf		=> $arg{shelf}		|| "",
		_rating		=> $arg{rating}		|| ask_rating($arg{name}),
	}, $class;
}

sub ask_rating { print "What is your rating for $_[0]? "; scalar <> }
