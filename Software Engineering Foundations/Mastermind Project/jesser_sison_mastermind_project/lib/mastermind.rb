require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    printf("There are %i exact matches.\n", @secret_code.num_exact_matches(code))
    printf("There are %i near matches.\n", @secret_code.num_near_matches(code))
  end

  def ask_user_for_guess
    print "\nEnter a code: "
    code = Code.from_string(gets.chomp)
    print_matches(code)
    @secret_code == code
  end
end
