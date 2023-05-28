require_relative "./author"
require_relative "./magazine"

class Article

    attr_reader :title, :author, :magazine
  
    @@all = []
  
    def initialize( author:, magazine:, title:)
        author.class == Author ? @author = author : @author = "Not an Author Object!"
        magazine.class == Magazine ? @magazine = magazine : @magazine = "Not a Magazine Object!"       
        title.class == String ? @title = title : @title = "Not a string!"
        @@all << self
    end
  
    def self.all
        @@all
    end
  
  end