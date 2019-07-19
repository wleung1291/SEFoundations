require "byebug"

class Bootcamp
#   PART 1
#   #initialize
#     should accept a name (string), slogan (string), and student_capacity (number) as args
#     should set the instance variables @name, @slogan, and @student_capacity
#     should set the instance variables @teachers and @students to empty arrays
#     should set the instance variable @grades to an empty hash where the default values are distinct empty arrays
#   #name
#     should get (return) the bootcamp's @name
#   #slogan
#     should get (return) the bootcamp's @slogan
#   #teachers
#     should get (return) the bootcamp's @teachers
#   #students
#     should get (return) the bootcamp's @students
#   #hire
#     should accept a teacher (string) and add them to the end of @teachers
#   #enroll
#     should accept a student (string) as an arg
#     when the number of enrolled students is below @student_capacity
#       should add the student to @students
#       should return true since the enrollment was successful
#     when the number of enrolled students is at @student_capacity
#       should not add the student to @students
#       should return false since the enrollment was not successful
#   #enrolled?
#     should accept a student (string) and return a boolean indicating whether the student is enrolled in the bootcamp

    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new{ |hash, k| hash[k] = [] }
    end

    # getters
    def name
        @name
    end

    def slogan 
        @slogan
    end

    def students
        @students
    end

    def teachers
        @teachers
    end

    # instance methods
    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        end

        return false
    end

    def enrolled?(student)
        return @students.include?(student.capitalize)
    end

#   PART 2
#   #student_to_teacher_ratio
#     should return an integer representing the ratio between # students to 1 teacher rounded down to the nearest integer
#   #add_grade
#     should accept a student (string) and a grade (number) and add that grade to the student's grades array inside of the @grades hash
#     when the student is already enrolled
#       should add the grade to the student's grades array inside of the @grades hash
#       should return true
#     when the student is not enrolled in the bootcamp
#       should not add the grade
#       should return false
#   #num_grades
#     should accept a student (string) and return the number of grades they have
#   #average_grade
#     should accept a student (string) and return a number representing their average grade rounded down to the nearest integer
#     should return nil if the student has no grades or is not enrolled

    def student_to_teacher_ratio
        numStudents = @students.length
        numTeachers = @teachers.length

        return (numStudents / numTeachers)
    end

    def add_grade(student, grade)
        if self.enrolled?(student)
            @grades[student] << grade 
            return true
        end

        return false
    end

    def num_grades(student)
        return @grades[student].length
    end

    def average_grade(student)
        numGrades = self.num_grades(student)

        if numGrades == 0 || !self.enrolled?(student)
            return nil
        end

        return @grades[student].sum / numGrades
    end
  
end
