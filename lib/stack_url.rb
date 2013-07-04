require 'cgi'

class StackUrl

  def search_for keyword
    "http://stackoverflow.com/search?q=" + CGI::escape(keyword)
  end

end