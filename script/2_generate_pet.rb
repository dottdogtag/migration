
require 'csv'

array = []

CSV.foreach("#{File.dirname(__FILE__)}/Pet_Profile.csv", headers: true) do |row|
  obj = row.to_hash
  email = obj['Account']
  md5_password = obj['Password']
  first_name = obj['first_name']
  last_name = obj['last_name']
  created_at = obj['Create_Date']
  updated_at = obj['Last_Modify_Date']



  update_hash =
  "{ email: '#{email}',
  password: '#{md5_password}',
  first_name: '#{first_name}',
  last_name: '#{last_name}',
  created_at: '#{created_at}',
  updated_at: '#{updated_at}' }"

  puts update_hash
  array.push update_hash
end

user_update_ruby = "User.create([#{array.join(",")}])"
File.write("#{File.dirname(__FILE__)}/Pet_Profile.rb", user_update_ruby)




# id,Pet_ID,"Avatar","Pet_Name","Species","Breed","MajorColour","AnotherColour","Sex","Age","Birthday","FoodRequire","OtherRequire","MicrochipNo","Description",Is_Lost,Status,"Create_Date","Last_Modify_Date",Modified_By
