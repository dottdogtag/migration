require 'csv'

array = []

CSV.foreach("#{File.dirname(__FILE__)}/../data_source/Pet_LostFound.csv", headers: true) do |row|
  obj = row.to_hash
  id = obj['id']
  user = obj['new_create_by_id']
  pet = obj['new_pet_id']
  message = obj['Descript']
  status = obj['Status']
  created_at = obj['Create_Date']
  updated_at = obj['Last_Modify_Date']

  update_hash =
    "{
      id: '#{id}',
      user_id: '#{user}',
      pet_id: '#{pet}',
      message: '#{message}',
      created_at: '#{created_at}',
      updated_at: '#{updated_at}'
    }"

  update_hash = {
    id: id,
    user_id: user,
    pet_id: pet,
    created_at: created_at,
    updated_at: updated_at,
    seeding_data: 'true'
  }

  if status == '1'
    update_hash.merge!(:found_at => updated_at)
  end

  if message == ""
    update_hash.merge!(:message => 'No message')
  else
    update_hash.merge!(:message => message)
  end


  update_hash_str = update_hash.to_s

  if user != 'NULL'
    puts update_hash_str
    array.push update_hash_str
  end
end

user_update_ruby = "LostReport.create([#{array.join(",")}])"
File.write("#{File.dirname(__FILE__)}/../results/LostReport.rb", user_update_ruby)
