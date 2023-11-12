require 'nokogiri'
require 'open-uri'

print ("Enter a site u want to parse\nExample: https://www.hospitalsafetygrade.org/all-hospitals\n-> ")
url = gets.chomp

doc = Nokogiri::HTML(URI.open(url))

print ("Enter a class u want to parse on this site\nExample: content\n->")
classs = gets.chomp

titles = doc.css("."+classs)

titles.each do |title|
  puts title.text.strip
end
