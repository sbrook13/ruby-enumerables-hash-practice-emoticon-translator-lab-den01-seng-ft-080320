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


def get_japanese_emoticon(file, emoticon)
  emoticons = YAML.load_file(file)
  new_emoticons = {}
  emoticons.each do |key, values| 
      new_emoticons[key] = {}
      new_emoticons[key][:english] = emoticons[key][0]
      new_emoticons[key][:japanese] = emoticons[key][1]
  end
  new_emoticons.each do |key, hash|
    # binding.pry
    if new_emoticons[key][:english] == emoticon
      return new_emoticons[key][:japanese]
    else !new_emoticons[key][:english] == emoticon
      "Sorry, that emoticon was not found"
    end
  end  
end

def get_english_meaning(file, emoticon)
  emoticons = YAML.load_file(file)
  new_emoticons = {}
  emoticons.each do |key, values| 
      new_emoticons[key] = {}
      new_emoticons[key][:english] = emoticons[key][0]
      new_emoticons[key][:japanese] = emoticons[key][1]
  end
  new_emoticons.each do |key, hash|
    if new_emoticons[key][:japanese] == emoticon
      return new_emoticons[key][:english]
    else !new_emoticons[key][:japanese] == emoticon
      "Sorry, that emoticon was not found"
    end
  end
end