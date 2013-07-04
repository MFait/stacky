require 'rspec'
require 'stack_url'

describe 'stack urls' do

  let(:stack_urls) { StackUrl.new }

  it { stack_urls.search_for("BlaBla").should eq("http://stackoverflow.com/search?q=BlaBla") }
  it { stack_urls.search_for("multiple keywords ?!").should eq("http://stackoverflow.com/search?q=multiple+keywords+%3F%21") }
  it { stack_urls.question("path/to/question").should eq("http://stackoverflow.com/path/to/question") }

end