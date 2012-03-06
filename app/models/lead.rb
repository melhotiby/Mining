class Lead < ActiveRecord::Base
  attr_accessible :title, :phone, :post_id, :state, :email, :post_date, :original_url
  
  def self.create_records(name, state)
    records = Craigslist.search(name, state)
    records.each do |record|
      values = Craigslist.reply_to(record[:url])
      Lead.create(email: values[0], post_id: values[1], title: record[:title], original_url: record[:url], post_date: record[:published_at], state: record[:location])
    end
  end
end
