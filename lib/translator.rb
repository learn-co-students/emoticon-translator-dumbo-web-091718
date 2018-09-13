# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emote_hash = {"get_meaning" => {}, "get_emoticon"=> {}}
  emoticons.each { |meaning, symbols_array|
    emote_hash["get_meaning"][symbols_array[1]]=meaning
    emote_hash["get_emoticon"][symbols_array[0]]=symbols_array[1]
  }
  emote_hash 
end

def get_japanese_emoticon(file_path, emoticon)
  load_library(file_path)["get_emoticon"].each { |japanese_emote, english_emote|
    if japanese_emote == emoticon 
      return english_emote
    end
  }
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
    load_library(file_path)["get_meaning"].each { |english_emote, meaning|
      if english_emote == emoticon  
        return meaning 
      end
  }
  "Sorry, that emoticon was not found"
end