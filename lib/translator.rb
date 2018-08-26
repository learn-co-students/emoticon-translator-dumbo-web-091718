# require modules here

def load_library(emoticons)
  # code goes here
  require "yaml"

  library = YAML.load_file(emoticons)

  get_meaning_array = library.keys
  get_emoticon_array = library.values

  get_meaning_hash = Hash[get_meaning_array.collect {|item| [item, ""]}]
  get_emoticon_hash = Hash[get_emoticon_array.collect {|item| [item, ""]}]

  library = {
    "get_meaning" => {
      "☜(⌒▽⌒)☞" => "angel",
      "ヽ(ｏ`皿′ｏ)ﾉ" => "angry",
      "(ΘεΘ;)" => "bored",
      "(゜.゜)" => "confused",
      "(#^.^#)" => "embarrased",
      ">゜))))彡"=> "fish",
      "(^0_0^)" => "glasses",
      "(￣ー￣)" => "grinning",
      "(＾ｖ＾)" => "happy",
      "(*^3^)/~☆" => "kiss",
      "(Ｔ▽Ｔ)" => "sad",
      "o_O" => "surprised",
      "(^_-)" => "wink"
    },
    "get_emoticon" => {
      "O:)" => "☜(⌒▽⌒)☞",
      ">:(" => "ヽ(ｏ`皿′ｏ)ﾉ",
      ":O" => "(ΘεΘ;)",
      "%)" => "(゜.゜)",
      ":$" => "(#^.^#)",
      "><>" => ">゜))))彡",
      "8D" => "(^0_0^)",
      "=D" => "(￣ー￣)",
      ":)" => "(＾ｖ＾)",
      ":*" => "(*^3^)/~☆",
      ":'(" => "(Ｔ▽Ｔ)",
      ":o" => "o_O",
      ";)" => "(^_-)"
    }
  }

  return library
end

def get_japanese_emoticon(emoticons, english_emoticon)
  # code goes here
  require "yaml"
  require "pry"

  emoticon_library = load_library(emoticons)

  if emoticon_library["get_emoticon"].include?(english_emoticon)
    return emoticon_library["get_emoticon"][english_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(emoticons, japanese_emoticon)
  # code goes here
  require "yaml"

  emoticon_library = load_library(emoticons)

  if emoticon_library["get_meaning"].include?(japanese_emoticon)
    return emoticon_library["get_meaning"][japanese_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
