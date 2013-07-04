require 'open-uri'
require 'rubygems'

class Stacky

  def query keyword
    stack_url = StackUrl.new

    question_doc = open(stack_url.search_for(keyword))
    question_page = QuestionPage.new(question_doc)

    return  question_page.first_link
  end

end