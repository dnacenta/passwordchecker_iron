require_relative "../lib/passwordchecker.rb"

RSpec.describe PasswordChecker do
  describe ".check_password" do
    let(:passwordchecker) {PasswordChecker.new}
    it "false for <7 chars" do
      expect(passwordchecker.check_password("abc@gmail.com","1234")).to be false
    end
    it 'false for only numbers' do
      expect(passwordchecker.check_password("abc@gmail.com","12346789")).to be false
    end
    it 'false if only low letters' do
      expect(passwordchecker.check_password("abc@gmail.com","aaaaaaaaaa")).to be false
    end
    it 'false if only letters' do
      expect(passwordchecker.check_password("abc@gmail.com","aaAAaaaaa")).to be false
    end
    it 'false if only leters and number' do
      expect(passwordchecker.check_password("abc@gmail.com","aaaa111AAAA")).to be false
    end
    it 'includes a letter, capital leters, number and symbols' do
      expect(passwordchecker.check_password("abc@gmail.com","aaaa111AA@$")).to be true
    end
    it 'if contains name from mail' do
      expect(passwordchecker.check_password("abc@gmail.com","abc111AAA€€€")).to be false
    end
    it 'if contains domain from mail' do
      expect(passwordchecker.check_password("abc@gmail.com","gmail11€€AAAA")).to be false
    end
  end
end
