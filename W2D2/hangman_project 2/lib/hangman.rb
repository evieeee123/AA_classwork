class Hangman
  DICTIONARY = ["cat", "apple", "bootcamp", "pizza", "food"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(letter)
    res = []
    @secret_word.each_char.with_index do |char, i|
      if char == letter
        res << i
      end
    end
    res
  end

  def fill_indices(char, arr)
    arr.each do |num|
      @guess_word[num] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    end

    @attempted_chars << char

    match = self.get_matching_indices(char)
    self.fill_indices(char, match)

    @remaining_incorrect_guesses -= 1 if match == []

    true
  end

  def ask_user_for_guess
    p 'Enter a char:'
    userinput = gets.chomp
    self.try_guess(userinput)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    end
    false
  end

end
