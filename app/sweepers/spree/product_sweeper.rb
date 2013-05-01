module Spree
  class ProductSweeper < ActionController::Caching::Sweeper
    observe Product

    def after_save(product)
      expire_action product_path(product)
      expire_action products_path
      expire_action "/"
      FileUtils.rm_rf "#{page_cache_directory}/t"
    end
  end
end
