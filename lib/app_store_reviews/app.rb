module AppStoreReviews
  # Represents an application
  class App
    attr_reader :id

    def initialize(id)
      @id = id
    end
  end
end
