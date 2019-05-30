class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, key| hash[key] = [] }
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        return false unless @students.length < @student_capacity
        @students << student
        true
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        return false unless self.enrolled?(student)
        @grades[student] << grade
        true
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        @grades[student].reduce(:+) / @grades[student].length if self.num_grades(student) > 0 && self.enrolled?(student)
    end
end
