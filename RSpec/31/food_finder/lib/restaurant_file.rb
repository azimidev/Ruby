class RestaurantFile

  @@delimiter = "\t"
  @@line_map = [:name, :cuisine, :price]
  
  def initialize(options={})
    self.filepath = options[:filepath]
  end
  
  def filepath=(path=nil)
    return if path.nil?
    @filepath = File.join(APP_ROOT, path)
    if !exists?
      create_save_file
    end
  end

  def exists?
    @filepath && File.exists?(@filepath)
  end
  
  def readable?
    @filepath && File.readable?(@filepath)
  end

  def writable?
    @filepath && File.writable?(@filepath)
  end

  def usable?
    exists? && readable? && writable?
  end

  def read
    restaurants = []
    if readable?
      file = File.new(@filepath, 'r')
      file.each_line do |line|
        restaurants << restaurant_from_line(line)
      end
      file.close
    end
    return restaurants
  end
  
  def append(restaurant)
    return false unless writable?
    File.open(@filepath, 'a') do |file|
      line_array = @@line_map.map {|a| restaurant.send(a)}
      file.puts "#{line_array.join(@@delimiter)}\n"
    end
    return true
  end
  
  private
  
    def create_save_file
      File.open(@filepath, 'w')
    end

    def restaurant_from_line(line)
      line_array = line.chomp.split(@@delimiter)
      attributes = Hash[@@line_map.zip(line_array)]
      return Restaurant.new(attributes)
    end

end
