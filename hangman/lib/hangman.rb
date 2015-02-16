# http://scrapmaker.com/data/wordlists/twelve-dicts/5desk.txt

#so here above is link to data, i think i want this file to read it and download it as a file, even though its a one time thing, the other alternative is to just copy and paste and then be on with it

#so how do i use a url

#there is prob a way to load the list everytime, but i'm not sure its necessary

def get_a_word #this isn't necessarily right, i think it can return a word that isn't 5 to 12
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

def hide_word(secret_word)
  view_word = ""
  secret_word.length.times do
    view_word << "_"
  end
  view_word
end

def solved?(secret_word, players_board)
  secret_word == players_board
end

def letter_replacer(array_of_correct_indexes, string_of_blank_spaces, guess)
  times_i_need_to_replace_letter = array_of_correct_indexes.count
  counter = 0
  times_i_need_to_replace_letter.times do
    string_of_blank_spaces[array_of_correct_indexes[counter]] = guess
    counter += 1
  end
end

def index_numbers_of_matching_letters(secret_word, guess)
  (0... secret_word.length).find_all {|i| secret_word[i, 1] == guess}
end

def end_of_game_handler(secret_word, players_board) # i have a method in a method here
  if solved?(secret_word, players_board)
    p "congrats!, you won!, as you know, the word was : #{secret_word}"
  else
    p "you suck! you lost"
    p "the word was: #{secret_word}"
  end
end



def new_game_controller
  secret_word = get_a_word
  number_of_guesses = 5
  letters_guessed = []
  players_board = hide_word(secret_word)
  p "Welcome to hangman!"
  until number_of_guesses  == 0 || solved?(secret_word, players_board) do
    p "you have guessed these letters: #{letters_guessed}"
    p "Here is your work so far: #{players_board}"
    p "you have: #{number_of_guesses} guesses left"
    p ""
    p "what is your guess?"
    guess = gets.chomp
    letters_guessed << guess
    if secret_word.include?(guess)
      indexes_of_correct_guess = index_numbers_of_matching_letters(secret_word, guess)
      letter_replacer(indexes_of_correct_guess, players_board, guess)
    else
      number_of_guesses -= 1
      p "try again!" if number_of_guesses != 0
    end
  end
  end_of_game_handler(secret_word, players_board)
end


new_game_controller

