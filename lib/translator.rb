# require modules here
require 'pry'

require "yaml"
  
def load_library(file)
  emoticons = YAML.load_file(file)
  new_emoticons = {}
  emoticons.each do |key, values| 
      new_emoticons[key] = {}
      new_emoticons[key][:english] = emoticons[key][0]
      new_emoticons[key][:japanese] = emoticons[key][1]
  end
  new_emoticons
end

def get_english_meaning(file, emoticon)
  library = load_library(file)
  library.each do |key, hash|
    if library[key][:japanese] == emoticon
      return key
    end 
  end
  library.each do |key, hash|  
    if !library[key][:japanese][emoticon]
      return "Sorry, that emoticon was not found"
    end
  end
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  library.each do |key, hash|
    # binding.pry
    if library[key][:english] == emoticon
      return library[key][:japanese]
    end
  end
  library.each do |key, hash|
    if !library[key][:english][emoticon]
      return "Sorry, that emoticon was not found"
    end
  end  
end

