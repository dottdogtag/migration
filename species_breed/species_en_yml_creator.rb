require 'json'

def format_string_with_underscore(natural_str)
  natural_str.downcase.tr(" ","_")
end

def get_species_key(species)
  species.downcase
end

write_array = []
ios_local_array = []
file = File.read("#{File.dirname(__FILE__)}/../species_breed/pet_species.json")
file_hash = JSON.parse(file)
species_array = file_hash['Params']

write_array.push "en:\n"
write_array.push "  species:\n" #2 spaces

species_array.each do |species_hash|
  species_key = get_species_key(species_hash['Code'])
  species_name = species_hash['Name']
  write_array.push "    #{species_key}: #{species_name}\n" #4 spaces
  ios_local_array.push "\"#{species_key}\" = \"#{species_name}\"; \n"
end

write_array.push "\n"
write_array.push "    breed:\n" #4 spaces

species_array.each do |species_hash|
  species_key = get_species_key(species_hash['Code'])
  write_array.push "      #{species_key}:\n"  #6 spaces
  breed_array = species_hash['NextParam']
  breed_array.sort_by!{ |hash| format_string_with_underscore(hash['Name'])}
  breed_array.each do |breed_hash|
    breed_key = format_string_with_underscore(breed_hash['Name'])
    breed_name = breed_hash['Name']
    write_array.push "        #{breed_key}: #{breed_name}\n" #8 spaces
    ios_local_array.push "\"#{breed_key}\" = \"#{breed_name}\"; \n"
  end
end

File.open("#{File.dirname(__FILE__)}/../species_breed/result/species.en.yml", "w") do |f|
  write_array.each do |line|
    f << line
  end
end

File.open("#{File.dirname(__FILE__)}/../species_breed/result/species_en_ios.txt", "w") do |f|
  ios_local_array.each do |line|
    f << line
  end
end


# en:
#   species:
#     dog: Dog
#     cat: Cat
#     bird: Bird

#     breed:
#       dog:
#         maltese: Maltese
#         mixed_breed: Mixed Breed
#         pekingese: Pekingese
#         pug: Pug
#         yorkshire_terrier: Yorkshire Terrier

#       cat:
#         angora: Angora
#         birman: Birman
#         chinchilla: Chinchilla
#         russian_blue: Russian Blue

#       bird:
#         parrot: Parrot
#         pigeon: Pigeon

