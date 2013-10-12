module AppStoreReviews
  class Store
    attr_reader :id

    def initialize(store_id_or_country)
      if store_id_or_country.is_a?(Integer)
        @id = store_id_or_country
      elsif store_id_or_country.is_a?(String)
        @id = resolve_store_id(store_id_or_country)
      end
    end

    private

    def resolve_store_id(country)
      store_data = AppStoreReviews::STORES.detect do |store|
        store[:country] == country
      end
      raise UnknownStore.new("Unknown store for country '#{country}'") unless store_data
      store_data[:id]
    end
  end

  class UnknownStore < StandardError; end
end
