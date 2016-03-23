require 'json'

def format_string_with_underscore(natural_str)
  natural_str.downcase.tr(" ","_")
end

def get_species_key(species)
  species.downcase
end

def get_breed_key(species, breed)
  species.downcase!
  breed = breed.to_s
  # file = File.read('./species_breed/pet_species.json')
  file = File.read("#{File.dirname(__FILE__)}/../species_breed/pet_species.json")
  file_hash = JSON.parse(file)
  species_array = file_hash['Params']
  for species_hash in species_array
    current_species_code = species_hash['Code'].downcase!
    if species == current_species_code
      for breed_hash in species_hash['NextParam']
        current_breed_code = breed_hash['Code']
        if breed == current_breed_code
          return format_string_with_underscore(breed_hash['Name'])
        end
      end
    end
  end
end
