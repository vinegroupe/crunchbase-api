module Crunchbase

  class NewsItem
    attr_reader :url
    attr_reader :author
    attr_reader :posted_on
    attr_reader :type
    attr_reader :title

    def initialize(data)
      @url = data['url']
      @author = data['author']
      @posted_on = Time.at(data['posted_on']) unless data['posted_on'].nil?
      @type = data['type']
      @title = data['title']
    end

  end

end
