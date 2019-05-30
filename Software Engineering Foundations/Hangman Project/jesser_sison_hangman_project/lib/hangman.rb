class Hangman
    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
    
    def self.random_word
        DICTIONARY.sample
    end

    def initialize
        @secret_word = Hangman.random_word
        @guess_word = ("_" * @secret_word.length).split("")
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
        @attempted_chars.include?(char)
    end

    def get_matching_indices(char)
        (0..@secret_word.length - 1).select { |i| @secret_word[i] == char }
    end

    def fill_indices(char, indices)
        indices.each { |i| @guess_word[i] = char }
    end

    def try_guess(char)
        if self.already_attempted?(char)
            print "That has already been attempted.\n"
            return false
        end
        @secret_word.include?(char) ? self.fill_indices(char, self.get_matching_indices(char)) : @remaining_incorrect_guesses -= 1
        @attempted_chars << char
        true
    end

    def ask_user_for_guess
        print "Enter a char: "
        self.try_guess(gets.chomp)
    end

    def win?
        return false unless @guess_word.join == @secret_word
        print "WIN\n"
        true
    end

    def lose?
        return false unless @remaining_incorrect_guesses == 0
        print "LOSE\n"
        true
    end

    def game_over?
        return false unless self.win? || self.lose?
        print "Secret word: " + @secret_word + "\n"
        true
    end
end
