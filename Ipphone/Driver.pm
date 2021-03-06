# Copyright 2011 by the Manoc Team
#
# This library is free software. You can redistribute it and/or modify
# it under the same terms as Perl itself.
package Manoc::Plugin::Ipphone::Driver;
use Moose;
extends 'Manoc::Search::Driver';

use Manoc::Plugin::Ipphone::Item;

sub search_ipphone {
    my ( $self, $query, $result ) = @_;

    my $pattern = $query->sql_pattern;
    my $schema  = $self->engine->schema;

    $pattern =~ s/[:\.]//g;

    my $search = { remote_id => { like => $pattern } };
    $query->limit and
      $search->{last_seen} = { '>' => $query->start_date };
    my $it = $schema->resultset('CDPNeigh')->search( $search );

    while ( my $e = $it->next ) {
	 $result->add_item( Manoc::Plugin::Ipphone::Item->new(
            {
                match     => $e->remote_id,
	        device    => $e->from_device,
	        iface     => $e->from_interface,
	        #mng_url   => $e->from_device->get_mng_url || '';
                timestamp => $e->get_column('last_seen'),
            }));
    }
}

no Moose;
__PACKAGE__->meta->make_immutable;
