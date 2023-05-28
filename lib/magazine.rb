class Magazine

    attr_accessor :name, :category
  
    @@all = []
  
    def initialize(name:, category:)
      name.class == String ? @name = name : @name = "Not a string!"
      category.class == String ? @category = category : @category = "Not a string!"
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def contributors
      self.contributors_articles.map{ |article| article.author }
    end
  
    def self.find_by_name(name)
      @@all.find { |obj| name == obj.name }
    end
  
    def article_titles
      self.contributors_articles.map{ |article| article.title }
    end
  
    def contributing_authors
      contributors.map { |author| author.name }.tally
      .filter{ |key, value| value.to_i >= 3 ? key : nil }.to_a
      .map { |nested_array| nested_array[0]}
    end
  
    private
  
    def contributors_articles
      Article.all.find_all { |article| @name == article.magazine.name }
    end
  end
  
  