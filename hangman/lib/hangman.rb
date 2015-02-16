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

def player_view_word(secret_word) #what does this do?
  view_word = ""
  secret_word.length.times do
    view_word << "_"
  end
  view_word
end

def solved?(secret_word, blank_space_show) #rename blank_space_show
  secret_word == blank_space_show
end

def letter_replacer(array_of_correct_indexes, string_of_blank_spaces, guess)
  times_i_need_to_replace_letter = array_of_correct_indexes.count
  counter = 0
  times_i_need_to_replace_letter.times do
    string_of_blank_spaces[array_of_correct_indexes[counter]] = guess
    counter += 1
  end
end

#fix blank space show variable name

def new_game #this is kinda like the controller
  secret_word = get_a_word
  number_of_guesses = 5
  letters_guessed = []
  blank_space_show = player_view_word(secret_word)
  p ""
  p "Welcome to hangman!"

  until number_of_guesses  == 0 || solved?(secret_word, blank_space_show) do


    p "you have guessed these letters: #{letters_guessed.each {|letter| p letter}}"
    p "Here is your work so far: #{blank_space_show}"
    p "you have: #{number_of_guesses} guesses left"
    p ""
    p "what is your guess?"
    guess = gets.chomp
    letters_guessed << guess
    if secret_word.include?(guess)
      p "that letter is included in the word"

      indexes_of_correct_guess = (0... secret_word.length).find_all {|i| secret_word[i, 1] == guess}

      p "correct guess index is:  #{indexes_of_correct_guess}"

      letter_replacer(indexes_of_correct_guess, blank_space_show, guess)

    else
      number_of_guesses -= 1
      p "try again!" if number_of_guesses != 0
    end
  end #ends do loop

  if solved?(secret_word, blank_space_show)
    p "congrats!, you won!"
  else
    p "you suck! you lost"
    p "the word was: #{secret_word}"
  end


end #ends new game meth





new_game

