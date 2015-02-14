# http://scrapmaker.com/data/wordlists/twelve-dicts/5desk.txt

#so here above is link to data, i think i want this file to read it and download it as a file, even though its a one time thing, the other alternative is to just copy and paste and then be on with it

#so how do i use a url

#there is prob a way to load the list everytime, but i'm not sure its necessary


def new_game
  #load dictionary, pick a random word that is 5-12 characters long
  dictionary = File.readlines("../words.txt")
  word = dictionary.sample
  word = word[0..-2] #remove new line character
  if word.length < 12 && word.length > 5
    word
  else
    word = dictionary.sample
    word = word[0..-2]
  end
  word

  # until word.length.betweeen?(5,12) do
  #   word = dictionary.sample
  # end
  # p word
  #don't forget to strip new line chars
end

p new_game

