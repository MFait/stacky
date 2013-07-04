require 'open-uri'
require 'rubygems'
Dir["./lib/*.rb"].each {|file | require file }

stack_url = StackUrl.new


question_doc = open(stack_url.search_for(ARGV.join(" ")))
question_page = QuestionPage.new(question_doc)

puts question_page.first_link
