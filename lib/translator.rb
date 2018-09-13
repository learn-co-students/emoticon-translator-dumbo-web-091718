# require modules here
require 'yaml'

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)

  hash = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons.each do |k, v|
    hash["get_emoticon"][v[0]] = v[1]
    hash["get_meaning"][v[1]] = k
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)

  if emoticon_hash["get_emoticon"].include?(emoticon)
    return emoticon_hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)

  if emoticon_hash["get_meaning"].include?(emoticon)
    return emoticon_hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
