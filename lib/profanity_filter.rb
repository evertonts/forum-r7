class ProfanityFilter
  def normalize(string)
    normalized_string = string.downcase
    normalizer = YAML.load_file("#{Rails.root}/config/character_normilizer.yml")
    
    normalizer.each do |key, value|
      next if value.nil?
      value.split(' ').each { |letter_like| normalized_string.gsub!(letter_like, key)  }
    end
    normalized_string
  end
end