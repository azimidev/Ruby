class Person
  attr_accessor :first_name, :last_name, :city, :state, :zip_code

  def full_name
    return @first_name + " " + @last_name
  end

  def city_state_zip
    csz = @city
    csz += ", #{@state}" if @state
    csz += " #{@zip_code}" if @zip_code
    return csz
  end
end
