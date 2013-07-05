require 'nokogiri'

class AnswerPage

  def initialize doc
    @doc = Nokogiri::HTML(doc)
  end

  def title
    @doc.xpath("//h1/a").first.text
  end

  def question
    @doc.xpath("//div[contains(@class,'post-text')]").first.text
  end

  def answer
    @doc.xpath("//*[contains(@class, 'vote-accepted-on')]/../../..//div[@class='post-text']").first.text
  end

end