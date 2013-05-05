Maxmcd/SpreePageCache
===========

This is a modified version of spree/spree_page_cache that uses action caching instead of page caching for use on heroku, modified readme below:

SpreePageCache
===========

This gem makes it safe to fully cache pages in spree application.

It doesn't specifiy what pages / actions to cache as that's application specific, but it does include coarse sweepers for products and taxon.

You generally need to include the following overrides into your application:

````ruby

Spree::HomeController.class_eval do
  caches_action :index
end

Spree::ProductsController.class_eval do
  caches_action :index, :show
end

Spree::TaxonsController.class_eval do
  caches_action :index, :show
end

````


Setup
--------------------
Add this to your gem file Gemfile

    gem "spree_page_cache", :github => 'maxmcd/spree_page_cache'

    rails g spree_page_caching:install

Copyright (c) 2011 Neeraj Singh, released under the New BSD License

