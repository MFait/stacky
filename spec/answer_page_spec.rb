require 'rspec'
require 'answer_page'

describe 'answer page' do

  it "should extract infos from answer document " do
    answer_page = AnswerPage.new(answer_doc("Some Title", "Some Question", "Some Answer"))

    answer_page.title.should eq("Some Title")
    answer_page.question.should eq("Some Question")
    answer_page.answer.should eq("Some Answer")
  end

end