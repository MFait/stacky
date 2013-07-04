require 'nokogiri'

class QuestionPage

  def initialize doc
    @doc = Nokogiri::HTML(doc)
  end

  def first_link
    elements = @doc.xpath("//*[contains(@class, 'result-link')]/span/a")
    elements.size > 0 ? elements.first["href"] : nil
  end

end