require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    puts "There are %i exact matches." [@secret_code.num_exact_matches(code)]
    puts "There are %i near matches." [@secret_code.num_near_matches(code)]
  end

  def ask_user_for_guess
    print "\nEnter a code: "
    code = Code.from_string(gets.chomp)
    print_matches(code)
    @secret_code == code
  end
end
