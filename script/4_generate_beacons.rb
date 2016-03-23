require 'csv'

array = []

CSV.foreach("#{File.dirname(__FILE__)}/../data_source/DOTT_Device.csv", headers: true) do |row|
  obj = row.to_hash
  id = obj['id']
  pet = obj['new_pet_id']
  bt_uuid = obj['UUID']
  bt_major = obj['Major']
  bt_minor = obj['Minor']
  latitude = obj['latitude']
  longitude = obj['longitude']
  created_at = obj['Create_Date']
  updated_at = obj['Last_Modify_Date']

  update_hash =
    "{
      id: '#{id}',
      pet_id: '#{pet}',
      bt_uuid: '#{bt_uuid}',
      bt_major: '#{bt_major}',
      bt_minor: '#{bt_minor}',
      lat: '#{latitude}',
      lng: '#{longitude}',
      computed_at: '#{updated_at}',
      created_at: '#{created_at}',
      updated_at: '#{updated_at}'
    }"

  if pet != 'NULL'
    puts update_hash
    array.push update_hash
  end
end

user_update_ruby = "Beacon.create([#{array.join(",")}])"
File.write("#{File.dirname(__FILE__)}/../results/Beacon.rb", user_update_ruby)
