require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emo_hash = {}
  get_meaning =  emoticons.each_with_object({}) {|a,h| h[a[1][1]] = a[0]}
  get_emoticon = emoticons.each_with_object({}) {|a,h| h[a[1][0]] = a[1][1]}
  emo_hash["get_meaning"] = get_meaning
  emo_hash["get_emoticon"] = get_emoticon
  #binding.pry
  emo_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  #binding.pry
  return emoticons["get_emoticon"][emoticon] unless emoticons["get_emoticon"].keys.include?(emoticon) == false
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  return emoticons["get_meaning"][emoticon] unless emoticons["get_meaning"].keys.include?(emoticon) == false
  "Sorry, that emoticon was not found"
end