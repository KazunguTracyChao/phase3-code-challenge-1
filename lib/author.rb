class Author

    attr_reader :name
  
    def initialize(name)
      @name = name
    end
  
    def articles
      Article.all.select { |article| @name == article.author.name}
    end
  
    def magazines
      articles.map{ |article| article.magazine }.uniq
    end
  
    def add_article(magazine, title)
      Article.new(author: self, magazine: magazine, title: title )
    end
  
    def topic_areas
      magazines.map{ |magazine| magazine.category }
    end
  
  end