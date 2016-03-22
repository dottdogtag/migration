require 'csv'

array = []

CSV.foreach("#{File.dirname(__FILE__)}/User_Account.csv", headers: true) do |row|
  obj = row.to_hash
  email = obj['Account']
  md5_password = obj['Password']
  first_name = obj['first_name']
  last_name = obj['last_name']
  created_at = obj['Create_Date']
  updated_at = obj['Last_Modify_Date']

  update_hash = "{ email: '#{email}', password: '#{md5_password}', first_name: '#{first_name}', last_name: '#{last_name}', created_at: '#{created_at}', updated_at: '#{updated_at}' }"
  puts update_hash
  array.push update_hash
end

user_update_ruby = "User.create([#{array.join(",")}])"
File.write("#{File.dirname(__FILE__)}/User_Account.rb", user_update_ruby)
