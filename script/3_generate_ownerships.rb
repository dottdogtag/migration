require 'csv'

array = []

CSV.foreach("#{File.dirname(__FILE__)}/../data_source/User_Pet.csv", headers: true) do |row|
  obj = row.to_hash
  id = obj['id']
  user = obj['new_user_id']
  pet = obj['new_pet_id']
  created_at = obj['Create_Date']
  updated_at = obj['Last_Modify_Date']

  update_hash =
    "{
      id: '#{id}',
      user_id: '#{user}',
      pet_id: '#{pet}',
      created_at: '#{created_at}',
      updated_at: '#{updated_at}'
    }"

  puts update_hash
  array.push update_hash
end

user_update_ruby = "Ownership.create([#{array.join(",")}])"
File.write("#{File.dirname(__FILE__)}/../results/Ownership.rb", user_update_ruby)
