require_relative 'Employee.rb'

class Manager < Employee
    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def bonus(multiplier)
        all_salaries = 0
        @employees.each do |employee|
            all_salaries += employee.salary
        end
        all_salaries * multiplier
    end

    def add_employee(employee)
        @employees << employee
    end
end

david = Employee.new("david", "TA", 10000, "darren")
shawna = Employee.new("shawna", "TA", 12000, "darren")
darren = Manager.new("darren", "TA manager", 78000, "ned")
ned = Manager.new("ned", "Founder", 1000000)

ned.add_employee(darren)
darren.add_employee(david)
darren.add_employee(shawna)
ned.add_employee(shawna)
ned.add_employee(david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
# p david
# p shawna
# p darren
# p ned