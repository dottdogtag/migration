require 'csv'

array = []

CSV.foreach("#{File.dirname(__FILE__)}/../data_source/Geo_Location.csv", headers: true) do |row|
  obj = row.to_hash
  id = obj['id']
  locatable_type = 'LostReport'
  locatable_id = obj['new_lost_id']
  lat = obj['Location_Lat']
  lng = obj['Location_Lng']
  created_at = obj['Create_Date']
  updated_at = obj['Last_Modify_Date']

  update_hash =
    "{
      id: '#{id}',
      locatable_type: '#{locatable_type}',
      locatable_id: '#{locatable_id}',
      lat: '#{lat}',
      lng: '#{lng}',
      created_at: '#{created_at}',
      updated_at: '#{updated_at}'
    }"

  puts update_hash
  array.push update_hash
end

user_update_ruby = "GeoLocation.create([#{array.join(",")}])"
File.write("#{File.dirname(__FILE__)}/../results/GeoLocation.rb", user_update_ruby)
