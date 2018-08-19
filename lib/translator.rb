require "yaml"

def load_library(filename)
  emoticons = YAML::load_file(filename)
  hash = {}
  jap2meaning = {}
  eng2jap = {}
  emoticons.each { |meaning, translation| jap2meaning[translation[1]] = meaning }
  emoticons.each { |meaning, translation| eng2jap[translation[0]] = translation[1]}

  hash['get_meaning'] = jap2meaning
  hash['get_emoticon'] = eng2jap
  hash
end

def get_japanese_emoticon(filepath, emoticon)
  emoticons = load_library(filepath)['get_emoticon']
  emoticons.include?(emoticon) ? emoticons.fetch(emoticon) : 'Sorry, that emoticon was not found'
end

def get_english_meaning(filepath, emoticon)
  emoticons = load_library(filepath)['get_meaning']
  emoticons.include?(emoticon) ? emoticons.fetch(emoticon) : 'Sorry, that emoticon was not found'