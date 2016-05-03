module AppStoreReviews
  # Represents a country store of iTunes
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

      unless store_data
        raise(UnknownStore, "Unknown store for country '#{country}'")
      end

      store_data[:id]
    end
  end

  class UnknownStore < StandardError; end
end
