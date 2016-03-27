require 'json'

def format_string_with_underscore(natural_str)
  natural_str.downcase.tr(" ","_")
end

def get_species_key(species)
  species.downcase
end

write_array = []
write_json_hash = {}
file = File.read("#{File.dirname(__FILE__)}/../species_breed/pet_species.json")
file_hash = JSON.parse(file)
species_array = file_hash['Params']

species_array.each do |species_hash|
  species_key = get_species_key(species_hash['Code'])
  write_array.push "#{species_key}: \n"
  breed_array = species_hash['NextParam']
  json_array = []

  breed_array.sort_by!{ |hash| format_string_with_underscore(hash['Name'])}
  # has_unknown = false
  # has_mixed_breed = false
  # breed_array.delete_if do |breed_hash|
  #   breed_key = format_string_with_underscore(breed_hash['Name'])
  #   if breed_key == 'unknown'
  #     has_unknown = true
  #     true
  #   end
  #   if breed_key == 'mixed_breed'
  #     has_mixed_breed = true
  #     true
  #   end
  # end
  # if has_unknown
  #   # breed_array.unshift { :Name => 'Unknown'}
  #   breed_array.insert( 0, { :Name => 'Unknown'} )
  # end
  # if has_mixed_breed
  #   # breed_array.unshift { :Name => 'Mixed breed'}
  #   breed_array.insert( 0, { :Name => 'Mixed breed'} )
  # end

  breed_array.each do |breed_hash|
    breed_key = format_string_with_underscore(breed_hash['Name'])
    json_array.push breed_key
    write_array.push "  - #{breed_key}\n"
  end
  # json_array.sort_by!{ |str| str.downcase}
  # write_array.sort_by!{ |str| str.downcase }
  write_json_hash[species_key] = json_array
end

File.open("#{File.dirname(__FILE__)}/../species_breed/result/species.yml", "w") do |f|
  write_array.each do |line|
    f << line
  end
end

File.open("#{File.dirname(__FILE__)}/../species_breed/result/species.json", "w") do |f|
  f << JSON.pretty_generate(write_json_hash)
end
