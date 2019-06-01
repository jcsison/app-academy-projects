require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    return false unless @salaries.has_key?(title)
    true
  end

  def >(startup)
    @funding > startup.funding
  end

  def hire(employee_name, title)
    raise "Employee title is invalid!" unless valid_title?(title)
    @employees << Employee.new(employee_name, title)
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    raise "Not enough funding!" unless @funding >= @salaries[employee.title]
    employee.pay(@salaries[employee.title])
    @funding -= @salaries[employee.title]
  end

  def payday
    @employees.each(&method(:pay_employee))
  end

  def average_salary
    total = @salaries.values_at(*@employees.map(&:title)).reduce(:+)
    total / @employees.length.to_f
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    @salaries = @salaries.merge(startup.salaries) { |key, o_val, n_val| o_val }
    @employees += startup.employees
    startup.close
  end
end
