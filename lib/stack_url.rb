require 'cgi'

class StackUrl

  BASE_URL = "http://stackoverflow.com/"

  def search_for keyword
    BASE_URL + "search?q=" + CGI::escape(keyword)
  end

  def question sub_path
    BASE_URL + sub_path
  end

end