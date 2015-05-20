# Ruby version 1.9+
require_relative 'contact_info.rb'
# Ruby version 1.9-
# require 'contact_info.rb'
class Person
  include ContactInfo
end

# Ruby version 1.9+
require_relative 'contact_info.rb'
# Ruby version 1.9-
# require 'contact_info.rb'
class Teacher
  include ContactInfo
  attr_accessor :lesson_plans
end

class Student < Person
  attr_accessor :books, :grades
end