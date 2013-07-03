require 'open-uri'
require 'rubygems'
require 'nokogiri'

# search on stackoverflow
uri = 'http://stackoverflow.com/search?q=XXX'
doc = Nokogiri::HTML(open(uri))

# extract questions
links = doc.xpath("//*[contains(@class, 'result-link')]/span/a")
#links.each { |a| puts a.text }

# load question
uri = 'http://stackoverflow.com/' + links.first["href"]
doc = Nokogiri::HTML(open(uri))
answer = doc.xpath("//*[contains(@class, 'vote-accepted-on')]/../../..//div[@class='post-text']").first.text

puts answer









