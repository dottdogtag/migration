require 'csv'
require 'securerandom'

array = []

CSV.foreach("#{File.dirname(__FILE__)}/../data_source/User_Account.csv", headers: true) do |row|
  obj = row.to_hash
  id = obj['id']
  email = obj['Account']
  dummy_password = SecureRandom.hex
  md5_password = obj['Password']
  first_name = obj['first_name']
  last_name = obj['last_name']
  created_at = obj['Create_Date']
  updated_at = obj['Last_Modify_Date']

  update_hash =
    "{
      id: '#{id}',
      email: '#{email}',
      password: '#{dummy_password}',
      md5_password: '#{md5_password}',
      first_name: '#{first_name}',
      last_name: '#{last_name}',
      created_at: '#{created_at}',
      updated_at: '#{updated_at}'
    }"

  puts update_hash
  array.push update_hash
end

user_update_ruby = "User.create([#{array.join(",")}])"
File.write("#{File.dirname(__FILE__)}/../results/User.rb", user_update_ruby)
