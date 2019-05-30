class GuessingGame
    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            @game_over = true
            print "You win!\n"
        elsif num > @secret_num
            print "Too big!\n"
        else
            print "Too small!\n"
        end
    end

    def ask_user
        print "\nEnter a number: "
        self.check_num(gets.chomp.to_i)
    end
end
