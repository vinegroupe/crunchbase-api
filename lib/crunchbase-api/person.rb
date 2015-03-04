module Crunchbase

  class Person < Entity

    RESOURCE_FIND = 'person'
    RESOURCE_LIST = 'people'

    attr_reader :first_name
    attr_reader :last_name
    attr_reader :permalink
    attr_reader :bio
    attr_reader :born_on
    attr_reader :died_on
    attr_reader :is_deceased
    attr_reader :location_uuid
    attr_reader :created_at
    attr_reader :updated_at

    attr_reader :founded_companies
    attr_reader :news

    def self.get(permalink)
      self.fetch_one permalink
    end

    def self.list(page = 1, order = ORDER_CREATED_AT_DESC)
      self.fetch_list page, order
    end

    def initialize(data)
      super(data)
      set_news(data)
    end
    private

    def property_keys
      %w[
        first_name last_name permalink bio born_on died_on is_deceased location_uuid created_at updated_at
      ]
    end

    def date_keys
      %w[born_on died_on]
    end

    def relationships
      %w[founded_companies news]
    end

    def set_news(data)
      return unless data && data['relationships']['news'] && data['relationships']['news'].respond_to?(:each)
      @news = data['relationships']['news'].map { |n| Crunchbase::PressReference.new(n) }
    end
  end

end
