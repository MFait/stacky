require 'rspec'
require 'stacky'

describe 'Stacky' do

  let(:stacky) { Stacky.new }

  it 'should search for given keywords' do
    stacky.should_receive(:open).with("http://stackoverflow.com/search?q=Some+stuff+i+don%27t+know+about")
    stacky.query("Some stuff i don't know about")
  end
end