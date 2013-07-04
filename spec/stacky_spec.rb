require 'rspec'
require 'stacky'

describe 'Stacky' do

  let(:stacky) { Stacky.new }

  it 'should search for given keywords' do
    stacky.should_receive(:open).with("http://stackoverflow.com/search?q=Some+stuff+i+don%27t+know+about")
    stacky.query("Some stuff i don't know about")
  end

  it 'should follow the link to the first question found' do
    question_doc = <<-DOC
      <div class="summary">
        <div class="result-link">
          <span>
            <a href="path/to/question" title="Some Question">Some Question</a>
          </span>
        </div>
      </div>
    DOC

    stacky.should_receive(:open).with("http://stackoverflow.com/search?q=anykeyword") { question_doc }
    stacky.should_receive(:open).with("http://stackoverflow.com/path/to/question")

    stacky.query("anykeyword")
  end

end