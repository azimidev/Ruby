describe 'String' do

  describe "#titleize" do

    it "capitalizes each word in a string" do
      expect("some title words".titleize).to eq("Some Title Words")
    end
    
    it "works with single-word strings" do
      expect("ruby".titleize).to eq("Ruby")
    end
    
    it "capitalizes all uppercase strings" do
      expect("ALL UPPERCASE WORDS".titleize).to eq("All Uppercase Words")
    end
    
    it "capitalizes mixed-case strings" do
      expect("cRaZY StrIng".titleize).to eq("Crazy String")
    end
    
  end
  
  describe '#blank?' do

    it "returns true if string is empty" do
      expect(''.blank?).to be true
    end

    it "returns true if string contains only spaces" do
      expect('   '.blank?).to be true
    end

    it "returns true if string contains only tabs" do
      expect("\t\t\t".blank?).to be true
    end

    it "returns true if string contains only spaces and tabs" do
      expect(" \t \t \t".blank?).to be true
    end
    
    it "returns false if string contains a letter" do
      expect('a'.blank?).to be false
    end

    it "returns false if string contains a number" do
      expect('0'.blank?).to be false
    end
    
  end
  
end
