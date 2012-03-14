class Craigslist
  require "nokogiri"
  require 'open-uri'
  
  def self.parse_url(query, total_count)
    i = 1
    posts = []
    non_sfl_sites = CraigScrape.new('us/fl', '- us/fl/miami', '- us/fl/keys')
    non_sfl_sites.each_post('crg', 'search/sss?query=' + query.gsub(' ', '+')) do |post|
     break if i > total_count
     i+=1
     posts << post
    end
    posts
  end
  
  def self.search(query, state)
    Craigler.find(query, :in => state.to_sym, :only => :jobs)
  end
  
  def self.reply_to(url)
    reply = ""
    post_id = false
    page = Nokogiri::HTML(open(url))
    page.css('a').each do |x|
      if x.text =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    		reply = x.text
    	end
    	value = x.attributes['href'].value if x.attributes['href']
    	if value && value != "" && post_id == false
    	 post_id = x.attributes['href'].value[/postingID=(\d+)/, 1]
    	end
    end
    [reply, post_id]
  end

end