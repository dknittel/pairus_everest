module GroupsHelper
  require 'dotenv'
  Dotenv.load

  def shorten_url(id)
    url = Googl.shorten("http://localhost:3000/?group=#{id}", '213.57.23.49', ENV['GOOGLE_API_TOKEN'])
    group = Group.find(id)
    short_url = url.short_url
    group.link = short_url
    short_url
  end
end
