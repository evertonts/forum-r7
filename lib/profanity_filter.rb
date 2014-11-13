# The profane words should be added to the blacklist.txt file

class ProfanityFilter
  include Singleton
  
  CONFIG_PATH = "#{Rails.root}/config"
  
  def normalize(string)
    normalized_string = string.downcase
    
    normalizer.each do |key, value|
      next if value.nil?
      value.split(' ').each { |letter_like| normalized_string.gsub!(letter_like, key)  }
    end
    normalized_string
  end
  
  def sanitize!(string)
    blacklist.each_line do |line|
      to_sub = /\b#{line.strip}\b/
      string.gsub!(to_sub, 'XXXX')
    end
    string
  end
  
  private
  
  def blacklist
    @blacklist ||= File.read("#{CONFIG_PATH}/blacklist.txt")
  end
  
  def normalizer
    @normalizer ||= YAML.load_file("#{CONFIG_PATH}/character_normalizer.yml")
  end 
end