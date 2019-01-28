#!/usr/bin/perl
use strict; 
use warnings;
use feature 'say'; 
use v5.10; 
use Data::Dumper;


my %hash1 = (
    name => {
        first  => "John",
        last   => "branham",
        middle => "visa",
    },
    address => {
        park   => "cubbon",
        doorno => "4/6",
        other  => {
            division => "division",
            city     => "Cincinati",
            state    => "Ohio",
            country  => {
                cont => "NA",
                code => "USA",
                pin  => "51123",
            },
            district => "district",
          }
    },
    status => "unmarried"
);

my $start_level = 0;
dump_data( \%hash1, $start_level );

sub dump_data {
    my ( $ref, $level ) = @_;
    die "You can only pass an HASH reference data"
      unless ref $ref eq 'HASH';
    for ( keys %{$ref} ) {
        print $/, 'Level ', $level, "\t" x $level, $_, '=>';
        if ( ref $ref->{$_} eq 'HASH' ) {
            dump_data( $ref->{$_}, ++$level );    ## sub called itself
        }
        else { print $ref->{$_}, $/ }
    }
}
