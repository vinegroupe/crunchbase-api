module Crunchbase

  class PressReference
    attr_reader :url
    attr_reader :author
    attr_reader :posted_on
    attr_reader :title

    def initialize(data)
      @url = data['url']
      @author = data['author']
      @posted_on = Date.parse(data['posted_on']) unless data['posted_on'].nil?
      @title = data['title']
    end

  end

end
