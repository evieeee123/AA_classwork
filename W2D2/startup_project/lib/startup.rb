require "employee"

class Startup

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        if @salaries.has_key?(title)
            return true
        end
        false
    end

    def >(another_startup)
        if self.funding > another_startup.funding
            return true
        end
        false
    end

    def hire(employee_name, title)
        if @salaries.has_key?(title)
            new_employee = Employee.new(employee_name, title)
            @employees << new_employee
        else
            raise_error
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding >= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise_error
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        count = 0
        @employees.each do |employee|
            count += @salaries[employee.title]
        end
        count / @employees.length * 1.0
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        another_startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        # @salaries[another_startup.title] = another_startup.pay(@salaries[another_startup.title])
        @employees += another_startup.employees
        another_startup.close
    end

end
