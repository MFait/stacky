require 'open-uri'
require 'rubygems'

class Stacky

  def initialize
    @stack_url = StackUrl.new
  end

  def query keyword
    path = question_page(keyword).first_link

    if path
      open(@stack_url.question(path))
    end
  end

  def question_page(keyword)
    question_doc = open(@stack_url.search_for(keyword))
    QuestionPage.new(question_doc)
  end

end