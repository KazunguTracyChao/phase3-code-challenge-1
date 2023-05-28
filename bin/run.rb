#!/usr/bin/env ruby
require 'pry'
require_relative '../config/environment'
# Creating authors
author1 = Author.new("John Doe")
author2 = Author.new("Jane Smith")
# Creating magazines
magazine1 = Magazine.new("Science Weekly", "Science")
magazine2 = Magazine.new("Tech Today", "Technology")
# Adding articles to authors and magazines
author1.add_article(magazine1, "The Importance of Quantum Mechanics")
author1.add_article(magazine2, "Artificial Intelligence in Modern Society")
author2.add_article(magazine1, "Advancements in Genetic Engineering")
# Retrieving topic areas for authors
puts(author1.topic_areas())  # Output: ["Science", "Technology"]
puts(author2.topic_areas())  # Output: ["Science"]
# Retrieving article titles for a magazine
puts(magazine1.article_titles())  # Output: ["The Importance of Quantum Mechanics", "Advancements in Genetic Engineering"]
# Retrieving contributing authors for a magazine
puts(magazine1.contributing_authors())  # Output: [author1]
puts(magazine2.contributing_authors())  # Output: [author1]
puts(author1.name)
def test_find_by_name
    found_magazine = Magazine.find_by_name("Tech Today")
    if found_magazine.nil?
      puts "Magazine not found"
    else
      puts "Found Magazine: #{found_magazine.name} (Category: #{found_magazine.category})"
    end
  end
  # Run the test
  test_find_by_name
# Test the contributing_authors method
def test_contributing_authors
    author1 = Author.new("John Doe")
    author2 = Author.new("Jane Smith")
    author3 = Author.new("Michael Johnson")
    magazine1 = Magazine.new("Science Weekly", "Science")
    magazine2 = Magazine.new("Tech Today", "Technology")
    article1 = Article.new(author1, magazine1, "Article 1")
    article2 = Article.new(author1, magazine1, "Article 2")
    article3 = Article.new(author1, magazine1, "Article 3")
    article4 = Article.new(author2, magazine1, "Article 4")
    article5 = Article.new(author2, magazine2, "Article 5")
    article6 = Article.new(author2, magazine2, "Article 6")
    magazine1.add_article(article1)
    magazine1.add_article(article2)
    magazine1.add_article(article3)
    magazine1.add_article(article4)
    magazine2.add_article(article5)
    magazine2.add_article(article6)
    # Test contributing_authors method
    contributing_authors_magazine1 = magazine1.contributing_authors
    contributing_authors_magazine2 = magazine2.contributing_authors
    puts "Contributing Authors for Magazine 1: #{contributing_authors_magazine1.map(&:name)}"
    puts "Contributing Authors for Magazine 2: #{contributing_authors_magazine2.empty? ? 'None' : contributing_authors_magazine2.map(&:name)}"
  end
  # Run the test
  test_contributing_authors