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
    view_word << "_"
  end
  view_word
end

def solve_judge(secret_word, guess_word)
  false unless secret_word == guess_word
end

def letter_replacer(indexes_of_correct_guess, blank_space_show, guess)
  times_i_need_to_replace_letter = indexes_of_correct_guess.count
  counter = 0
  times_i_need_to_replace_letter.times do
    blank_space_show[indexes_of_correct_guess[counter]] = guess
    counter += 1
  end
end

def new_game
  #run until solved condition is true
  #run until count = 0 you loose
  secret_word = get_a_word
  count = 5
  letters_guessed = []
  blank_space_show = player_view_word(secret_word)
  p "Welcome to hangman!"

  until count  == 0 do #or until solved

    p "developer only: (the answer is: #{secret_word})"

    p "you have guessed these letters: #{letters_guessed}"
    p "Here is your work so far: #{blank_space_show}"
    #so this is confusing, i want a method to




    p "you have: #{count} guesses left"
    p "what is your guess?"
    guess = gets.chomp
    p "You guessed: #{guess}"
    letters_guessed << guess

    if secret_word.include?(guess)
      p "that letter is included in the word"

      indexes_of_correct_guess = (0... secret_word.length).find_all {|i| secret_word[i, 1] == guess}

      p "correct guess index is:  #{indexes_of_correct_guess}"



#letter replacer method could go here to....

      #args passed in: indexes_of_correct_guess,

      # def another_replacer(array)
      #   times_i_need_to_replace_letter = array.count
      #   counter = 0

      # end


      letter_replacer(indexes_of_correct_guess, blank_space_show, guess)


    #sandwhiching logic that works: all the way to....
      # times_i_need_to_replace_letter = indexes_of_correct_guess.count
      # counter = 0
      # times_i_need_to_replace_letter.times do
      #   p "begin replacer loop, counter is; #{counter}"
      #   blank_space_show[indexes_of_correct_guess[counter]] = guess
      #   p "blanks space show is: #{blank_space_show}"
      #   counter += 1
      #   p "counter is now: #{counter}"
      # end
    #end sandwhich logic protector

# here! (end potential letter replacer method)



    else
      count -= 1
      p "try again!"

    end
  end #ends do loop
end #ends new game method





new_game

