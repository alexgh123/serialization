# http://scrapmaker.com/data/wordlists/twelve-dicts/5desk.txt

#so here above is link to data, i think i want this file to read it and download it as a file, even though its a one time thing, the other alternative is to just copy and paste and then be on with it

#so how do i use a url

#there is prob a way to load the list everytime, but i'm not sure its necessary

def get_a_word # i need to clean this up
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
end

def player_view_word(secret_word)
  view_word = ""
  secret_word.length.times do
    view_word << " _ "
  end
  view_word
end

def new_game
  #run until solved condition is true
  #run until count = 0 you loose
  secret_word = get_a_word
  count = 5
  letters_guessed = []
  p "Welcome to hangman!"

#untill  guess count is 0 or solved = true


  p "you have: #{count} guesses left"
  p "what is your guess?"
  guess = gets.chomp
  p "You guessed: #{guess}"
  letters_guessed << guess

  if secret_word.include?(guess)
    p "that letter is included in the word (the answer is: #{secret_word})"
  else
    count -= 1
    p "try again! (the answer is: #{secret_word}"
    p "Here is your work so far: #{player_view_word(secret_word)}"
  end
  p "you have guessed these letters: #{letters_guessed}"
  p "Here is your work so far: #{player_view_word(secret_word)}"

#i need to have a string that only includes blank spaces

  #if the word gue
  #the guess string has as many '_' characters as there are words in the secret word
  #i can build a method that just prints the player_view_word

end



new_game

