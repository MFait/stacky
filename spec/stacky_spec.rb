require 'rspec'
require 'stacky'

describe 'Stacky' do

  let(:stacky) { Stacky.new }

  it 'should search for given keywords' do
    stacky.should_receive(:open).with("http://stackoverflow.com/search?q=Some+stuff+i+don%27t+know+about")
    stacky.query("Some stuff i don't know about")
  end

  it 'should follow the link to the first question found and parse answer' do
    stacky.should_receive(:open).with("http://stackoverflow.com/search?q=anykeyword") {
      question_doc_with_path "path/to/question"
    }

    stacky.should_receive(:open).with("http://stackoverflow.com/path/to/question") {
      answer_doc "The Title", "The Question", "The Answer"
    }

    stacky_says = stacky.query("anykeyword")

    #stacky_says.should include("The Title")
    #stacky_says.should include("The Question")
    #stacky_says.should include("The Answer")
  end

  def question_doc_with_path path
    <<-DOC
      <div class="summary">
        <div class="result-link">
          <span>
            <a href="#{path}" title="Some Question">Some Question</a>
          </span>
        </div>
      </div>
    DOC
  end

  def answer_doc title, question, answer
    <<-DOC
      <div id="question-header">
        <h1 itemprop="name"><a href="/questions/127932/" class="question-hyperlink">#{title}</a></h1>
      </div>
      <div class="post-text" itemprop="description">
        <p><code>#{question}</code>:</p>
      </div>
      <tr>
        <td class="votecell">
          <div class="vote">
            <span class="vote-accepted-on load-accepted-answer-date">accepted</span>
          </div>
        </td>
        <td class="answercell">
          <div class="post-text">#{answer}</div>
        </td>
      </tr>
    DOC
  end

end