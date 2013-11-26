# Copyright 2011 by the Manoc Team
#
# This library is free software. You can redistribute it and/or modify
# it under the same terms as Perl itself.
package Manoc::Plugin::Conf::Driver;
use Moose;
extends 'Manoc::Search::Driver';

use Manoc::Plugin::Conf::Item;

sub search_conf {
    my ( $self, $query, $result ) = @_;

    my $pattern = $query->sql_pattern;
    my $schema  = $self->engine->schema;

    $pattern =~ s/://g;


    my $search = { config => { like => $pattern } };
    $query->limit and
      $search->{last_seen} = { '>' => $query->start_date };
    my $it = $schema->resultset('DeviceConfig')->search( $search );

    while ( my $e = $it->next ) {
	 $result->add_item( Manoc::Plugin::Conf::Item->new(
            {
            match        => $e->device->address,
	    device_entry => $e->device_info,
	        #mng_url   => $e->from_device->get_mng_url || '';
            }));
    }
}

no Moose;
__PACKAGE__->meta->make_immutable;
