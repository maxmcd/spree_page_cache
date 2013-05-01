module Spree
  class TaxonSweeper < ActionController::Caching::Sweeper
    observe Taxon

    def after_save(taxon)
      expire_action "/"
      expire_action products_path
      FileUtils.rm_rf "#{page_cache_directory}/products"
      FileUtils.rm_rf "#{page_cache_directory}/t"
    end
  end
end
