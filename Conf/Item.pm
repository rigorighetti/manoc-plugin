
# Copyright 2011 by the Manoc Team
#
# This library is free software. You can redistribute it and/or modify
# it under the same terms as Perl itself.
package Manoc::Plugin::Conf::Item;
use Moose;
use Manoc::IpAddress;

extends 'Manoc::Search::Item::Group';

has '+item_type' => ( default => 'conf' );

has 'device_entry' => (
    is     => 'ro',
    required => 1,
);


no Moose;
__PACKAGE__->meta->make_immutable;
