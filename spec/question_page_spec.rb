require 'rspec'
require 'question_page'

describe 'question page' do

  it "should extract link to first question from question page" do
    doc = <<-DOC
      <div class="summary">
        <div class="result-link">
          <span>
            <a href="/link/to/first/question" title="Some Question">Some Question</a>
          </span>
        </div>
      </div>
      <div class="summary">
        <div class="result-link">
          <span>
            <a href="/link/to/second/question" title="Some Question">Some Question</a>
          </span>
        </div>
      </div>
    DOC

    question_page = QuestionPage.new(doc)

    question_page.first_link.should eq("/link/to/first/question")
  end

  it "should return nil for a bad question page" do
    doc = "not a real question page"

    question_page = QuestionPage.new(doc)
    question_page.first_link.should be_nil
  end

end