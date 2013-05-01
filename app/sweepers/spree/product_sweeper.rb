module Spree
  class ProductSweeper < ActionController::Caching::Sweeper
    observe Product

    def after_save(product)
        expire_action(:controller => "/spree/home", :action => "index")
        expire_action(:controller => "/spree/products", :action => "index")
        expire_action(:controller => "/spree/taxons", :action => "show")
        expire_action(:controller => "/spree/products", :action => "show", :id => product)
        # FileUtils.rm_rf "#{page_cache_directory}/t"
    end
  end
end
