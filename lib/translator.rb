# require modules here
require 'yaml'

def load_library(path)
  emoticons = YAML.load_file("./lib/emoticons.yml")
  emoticon_hash = {}
  emoticon_hash["get_emoticon"] = {}
  emoticon_hash["get_meaning"] = {}

  emoticons.each do |english, emoticon_set|
    emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
    emoticon_hash["get_meaning"][emoticon_set.last] = english
  end
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library("./lib/emoticons.yml")
  result = emoticon_hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(path, emoticon)
  # code goes here
  emoticon_hash = load_library("./lib/emoticons.yml")
  result = emoticon_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end
