# This helper is opening up core Ruby String class 
# in order to add new methods to all strings
class String
  
  # Ruby has a capitalize method (used below) which 
  # capitalizes the first letter of a string. But in 
  # order to capitalize the first letter of EVERY 
  # word we have to write our own.
  def titleize
    self.split(' ').collect {|word| word.capitalize}.join(' ')
  end
  
  # Allows us to test if a string contains only whitespace characters
  def blank?
    /\A[[:space:]]*\z/ === self
  end
  
end
