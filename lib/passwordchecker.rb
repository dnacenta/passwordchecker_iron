require "pry"
class PasswordChecker
  def initialize
  end

  def check_password(email,password)
    # binding.pry
    name = email[/^[^@]+/]
    domain = email[/(?<=@)[^.]+/]
    return false if password.length <= 7
    return false unless password =~ /[a-z]/ && password =~ /[A-Z]/ && password =~ /\d/ && password =~ /\W/
    return false if password =~/#{name}/ || password =~/#{domain}/
    true
  end
end
