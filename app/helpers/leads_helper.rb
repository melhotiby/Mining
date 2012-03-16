module LeadsHelper
  
  #values need to access the craigslist api based on this https://github.com/threetrieslater/craigler
  def us_states
      [
        ['All', 'anywhere'],
        ['Alabama', 'alabama'],
        ['Alaska', 'alaska'],
        ['Arizona', 'arizona'],
        ['Arkansas', 'arkansas'],
        ['California', 'california'],
        ['Colorado', 'colorado'],
        ['Connecticut', 'connecticut'],
        ['Delaware', 'delaware'],
        ['District of Columbia', 'dc'],
        ['Florida', 'florida'],
        ['Georgia', 'georgia'],
        ['Hawaii', 'hawaii'],
        ['Idaho', 'idaho'],
        ['Illinois', 'illinois'],
        ['Indiana', 'indiana'],
        ['Iowa', 'iowa'],
        ['Kansas', 'kansas'],
        ['Kentucky', 'kentucky'],
        ['Louisiana', 'louisiana'],
        ['Maine', 'maine'],
        ['Maryland', 'maryland'],
        ['Massachusetts', 'mass'],
        ['Michigan', 'michigan'],
        ['Minnesota', 'minnesota'],
        ['Mississippi', 'mississippi'],
        ['Missouri', 'missouri'],
        ['Montana', 'montana'],
        ['Nebraska', 'nebraska'],
        ['Nevada', 'nevada'],
        ['New Hampshire', 'n_hampshire'],
        ['New Jersey', 'new_jersey'],
        ['New Mexico', 'new_mexico'],
        ['New York', 'new_york'],
        ['North Carolina', 'n_carolina'],
        ['North Dakota', 'north_dakota'],
        ['Ohio', 'ohio'],
        ['Oklahoma', 'oklahoma'],
        ['Oregon', 'oregon'],
        ['Pennsylvania', 'pennsylvania'],
        ['Rhode Island', 'rhode_island'],
        ['South Carolina', 's_carolina'],
        ['South Dakota', 'south_dakota'],
        ['Tennessee', 'tennessee'],
        ['Texas', 'texas'],
        ['Utah', 'utah'],
        ['Vermont', 'vermont'],
        ['Virginia', 'virginia'],
        ['Washington', 'washington'],
        ['West Virginia', 'west_virginia'],
        ['Wisconsin', 'wisconsin'],
        ['Wyoming', 'wyoming']
      ]
  end
  
  def choices
    [['All For Sale Or Wanted', :all_for_sale_or_wanted], ['Art And Crafts', :art_and_crafts], ['Auto Parts', :auto_parts], ['Baby And Kid Stuff', :baby_and_kid_stuff], ['Barter', :barter], ['Bicycles', :bicycles], ['Boats', :boats], ['Books', :books], ['Business', :business], ['Cars And Trucks', :cars_and_trucks], ['Clothing', :clothing], ['Collectibles', :collectibles], ['Community', :community], ['Computers And Tech', :computers_and_tech], ['Electronics', :electronics], ['Event', :event], ['Farm And Garden', :farm_and_garden], ['Free Stuff', :free_stuff], ['Furniture', :furniture], ['Games And Toys', :games_and_toys], ['Garage Sales', :garage_sales], ['General', :general], ['Gigs', :gigs], ['Household', :household], ['Housing', :housing], ['Items Wanted', :items_wanted], ['Jewelry', :jewelry], ['Jobs', :jobs], ['Materials', :materials], ['Media', :media], ['Motorcycles', :motorcycles], ['Musical Instruments', :musical_instruments], ['Personals', :personals], ['Photo And Video', :photo_and_video], ['Recreational Vehicles', :recreational_vehicles], ['Resume', :resume], ['Services Offered', :services_offered], ['Sporting Goods', :sporting_goods], ['Tickets', :tickets], ['Tools', :tools]]
  end
  
end
