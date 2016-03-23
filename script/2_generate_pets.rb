require 'csv'

array = []

CSV.foreach("#{File.dirname(__FILE__)}/../data_source/Pet_Profile.csv", headers: true) do |row|
  obj = row.to_hash

  id = obj['id']
  name = obj['Pet_Name']
  avatar_url = "https://dott-pub.s3-us-west-2.amazonaws.com/polar-development/legacy/#{obj['Avatar']}"
  # avatar_url
  # species #needs to convert old numeric Code to new string key
  # breed
  color = obj['MajorColour']
  gender = ''
  birthday = obj['Birthday']
  food_re = obj['FoodRequire']
  other_re = obj['OtherRequire']
  desc = obj['Description']
  microchip = obj['MicrochipNo']
  lost_status = obj['Is_Lost']
  created_at = obj['Create_Date']
  updated_at = obj['Last_Modify_Date']

  if obj['Sex'] == '001'
    gender = 'male'
  elsif obj['Sex'] == '002'
    gender = 'female'
  elsif obj['Sex'] == '003'
    gender = 'male_neutered'
  elsif obj['Sex'] == '004'
    gender = 'female_sprayed'
  end





  # update_hash_str =
  #   "{
  #     id: '#{id}',
  #     name: '#{name}',
  #     color: '#{color}',
  #     birthday: '#{birthday}',
  #     food_requirements: '#{food_re}',
  #     other_requirements: '#{other_re}',
  #     desc: '#{desc}',
  #     microchip: '#{microchip}',
  #     status: '#{lost_status}',
  #     created_at: '#{created_at}',
  #     updated_at: '#{updated_at}'
  #   }"

  update_hash = {
    id: id,
    name: name,
    avatar_url: avatar_url,
    # color: color,
    # birthday: birthday,
    # food_requirements: food_re,
    # other_requirements: other_re,
    # description: desc,
    # microchip_number: microchip,
    # status: lost_status,
    created_at: created_at,
    updated_at: updated_at,
    seeding_data: 'true'
  }

  if birthday != 'NULL'
    update_hash.merge!(:birthday => birthday)
  end

  if color != 'NULL'
    update_hash.merge!(:color => color)
  end

  if food_re != 'NULL'
    update_hash.merge!(:food_requirements => food_re)
  end

  if other_re != 'NULL'
    update_hash.merge!(:other_requirements => other_re)
  end

  if microchip != 'NULL'
    update_hash.merge!(:microchip_number => microchip)
  end

  if desc != 'NULL'
    update_hash.merge!(:description => desc)
  end


  if gender != ''
    update_hash.merge!(:gender => gender)
  end

  if lost_status == "1"
    update_hash.merge!(:status => 'lost')
  end

  update_hash_str = update_hash.to_s




  puts update_hash_str
  array.push update_hash_str
end

user_update_ruby = "Pet.create([#{array.join(",\n")}])"
File.write("#{File.dirname(__FILE__)}/../results/Pet.rb", user_update_ruby)


# id,Pet_ID,"Avatar","Pet_Name","Species","Breed","MajorColour","AnotherColour","Sex","Age","Birthday",
# "FoodRequire","OtherRequire","MicrochipNo","Description",Is_Lost,Status,"Create_Date","Last_Modify_Date",Modified_By
