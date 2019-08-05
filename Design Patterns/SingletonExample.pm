package SingletonExample;

use strict;
use warnings;

use Clone 'clone';

# Package variable, not global variable. Doesn't suffer from the "inner
# subroutine" problems that .pl files suffer from in mod_perl.
my $_singlton_instance;

sub new {
  my $class = shift;

  return $_singleton_instance if defined $_singleton_instance;

  $_singleton_instance = { };

  bless $_singleton_instance, $class;

  $_singleton_instance->_initialize();

  return $_singleton_instance;
}

sub _initialize {
  my $self = shift;

  $self->{'immutable_stuff'} = { 'foo' => 'bar' };

  return;
}

sub get_immutable_stuff {
  my $self = shift;

  my $immutable_stuff = $self->{'immutable_stuff'};

  # We don't want consumers mucking about with our internal state
  return clone($immutable_stuff)
}
