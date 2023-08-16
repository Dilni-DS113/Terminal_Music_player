require './student' # put your record definition in student.rb

def read_student()
student_id = puts("X233900")
student_first_name = puts("John")
student_last_name = puts("Lennox")
student_course = puts("BICT")
student_phone_number = puts("1300 CALL ME")
studnet = Student.new()
student.id  = student_id
student.first_name = student_first_name
student.last_name = student_last_name
student.course = student_course
student.phone_number = student_phone_number
return student 
end 

def print_student(student)
puts (student.id)
puts (student.first_name)
puts (student.last_name)
puts (student.course)
puts(student.phone_number)

end 

def main()
student = read_student()
print_student(student)
end

main()