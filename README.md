manoc-plugin
============


    In this moment the plugin system is used to extend the capabilities of the search engine but is not excluded that in the future the system will be generalized
    In order to implements new plugins you have to:
        Create a new folder inside lib/Manoc/Plugin
        Put inside this folder a class named Init.pm that implements the load() method. This method will be invoked before the creation of the Manoc object and the most important operation that this method will perform is to register himself to the plugin registry calling the utility subroutine Manoc::_add_plugin(<plugin_name>, {type => 'search'});
        Create a driver class, that extends Manoc::Search::Driver, named Driver.pm that implements the search's work and returns a number of Manoc::Search::Item objects that represent the result objects. The driver must have a subroutine named "search_<plugin_name>" (e.g. if the plugin's name is ipphone the subroutine's name will be "search_ipphone").
        An Item.pm class, that extends Manoc::Search::Item or Manoc::Search::Item::Group, that describes the searches results of the plugin.

