module Spree
  class TaxonSweeper < ActionController::Caching::Sweeper
    observe Taxon

    def after_save(taxon)
        expire_action(:controller => "/spree/home", :action => "index")
        expire_action(:controller => "/spree/products", :action => "index")
      # FileUtils.rm_rf "#{page_cache_directory}/products"
      # FileUtils.rm_rf "#{page_cache_directory}/t"
    end
  end
end
