require 'rspec'
require 'spec_helper'
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

    stacky_says.should include("The Title")
    stacky_says.should include("The Question")
    stacky_says.should include("The Answer")
  end

end