require 'open-uri'
require 'rubygems'

class Stacky

  def initialize
    @stack_url = StackUrl.new
  end

  def query keyword
    path = question_page(keyword).first_link

    return "nothing found" unless path

    answer = answer_page(path)

    "-------------------------------------" + "\n" +
    answer.title + "\n" +
    "-------------------------------------" + "\n" +
    answer.question + "\n" +
    "-------------------------------------" + "\n" +
    answer.answer + "\n" +
    "-------------------------------------"+ "\n"
  end

  def answer_page(path)
    answer_doc = open(@stack_url.question(path))
    AnswerPage.new(answer_doc)
  end


  def question_page(keyword)
    question_doc = open(@stack_url.search_for(keyword))
    QuestionPage.new(question_doc)
  end

end