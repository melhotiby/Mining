class Lead < ActiveRecord::Base
  attr_accessible :title, :phone, :post_id, :state, :email, :post_date, :original_url
  
  def self.create_records(name, state)
    count = 0
    records = Craigslist.search(name, state)
    records.each do |record|
      values = Craigslist.reply_to(record[:url])
      found_lead = Lead.find_by_post_id(values[1])
      unless found_lead
        count += 1
        Lead.create(email: values[0], post_id: values[1], title: record[:title], original_url: record[:url], post_date: record[:published_at], state: record[:location])
      end
    end
    count
  end
    
end
