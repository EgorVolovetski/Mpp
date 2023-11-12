require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(URI.open('https://www.hospitalsafetygrade.org/all-hospitals'))

titles = doc.css(".content")

titles.each do |title|
  puts title.text.strip
end