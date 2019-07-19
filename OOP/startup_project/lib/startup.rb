require "employee"

class Startup

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries #hash containing `title` => `salary` pairs
        @employees = []
    end

    attr_reader :name, :funding, :salaries, :employees

    def valid_title?(title)
        if salaries.include?(title)
            return true
        end

        return false
    end

    #  should accept another startup as an arg
    #  when our startup (self) has more funding than the arg
    #    should return true
    #  when our startup (self) does not have more funding than the arg
    #    should return false
    def >(other_startup)
        if @funding > other_startup.funding
            return true
        end

        return false
    end

    def hire(name, title)
        if valid_title?(title)
            @employees << Employee.new(name, title)
        else
            raise "title is invalid"
        end
    end

    def size
        return @employees.length
    end

    #  should accept an Employee instance as an arg
    #  when the startup has enough funding to pay the employee
    #    should call Employee#pay with the salary that corresponds with their title
    #    should reduce the startup's @funding by the amount payed
    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary    
            employee.pay(salary)
            @funding -= salary
        else
            raise "not enough funding!" 
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end 
    end

    def average_salary
        total_salary = 0
        avg_sal = 0

        @employees.each do |employee|
            title = employee.title
            @salaries.each do |pos, salary|
                if title == pos
                    total_salary += salary
                end
            end
        end

        avg_sal = total_salary / employees.length
        return avg_sal
    end

    def close 
        @employees = []
        @funding = 0
    end

    #  should accept another startup as an arg
    #  should add the given startup's funding to our @funding
    #  should add the given startup's salaries to our @salaries, without 
    #  overwriting any of our existing @salaries
    #  should add the given startup's employees to our @employees
    #  should call Startup#close on the given startup
    def acquire(other_startup)
        
        @funding = @funding + other_startup.funding
      
        other_startup.salaries.each do |pos, salary|
            if !@salaries.include?(pos)
                @salaries[pos] = salary
            end
        end

        # concate employees
        @employees += other_startup.employees

        other_startup.close()
    end
end
