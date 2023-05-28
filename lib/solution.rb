
class Magazine
    attr_accessor :name, :category
    @@all = []
  
    def initialize(name, category)
      @name = name
      @category = category
      ##shovel each new instance into an array
      @@all << self
    end
  
    def self.all
      @@all
    end
  
       ##helper function
    def magazine_articles
      Article.all.select{|article| article.magazine.name == self.name}
    end
  
    def contributors
      magazine_articles.collect{|article| article.author}.uniq
    end
  
    def self.find_by_name(name)
      find_magazines = self.all.select { |magazine| magazine.name == name}
      find_magazines.first
    end
  
    def article_titles
      magazine_articles.collect{|article| article.title}
    end
  
    def contributing_authors
      main_authors = []
      
      magazine_authors = magazine_articles.collect{|article| article.author}.uniq
      magazine_authors.tally.each {|key, value|  values > 2 && (main_authors << key)}
      main_authors
    end
  
  end
  
  
  
  class Article
    attr_reader :magazine, :title
    @@all = []
  
    def initialize(author, magazine, title)
      @author = author
      @magazine = magazine
      @title = title
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def author
      @author.name
     end
  
  end
  
  
  class Author
    attr_reader :name
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def articles
      Article.all.select{|article| article.author==self.name}
    end
  
    def magazines
      all_magazines = articles.map{ |article| article.magazine}
      all_magazines.uniq
    end
  
    def add_article(magazine, title)
      Article.create(self, magazine, title)
    end
  
    def topic_areas
      magazines.collect{|magazine| magazine.category}.uniq
    end
  
  
  end