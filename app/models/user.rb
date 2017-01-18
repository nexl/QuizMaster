class User < ApplicationRecord
  
  default_value_for :role, 'Student'

  has_many :quizz, :inverse_of => :user
  
  has_secure_password
  
  ALPHABET_ONLY = /[A-Za-z\d]/i
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :presence => true, :format => { :with => ALPHABET_ONLY, :message => "Alphabet only"}
  validates :last_name, :presence => true, :format => { :with => ALPHABET_ONLY, :message =>"Alphabet only"}
  validates :email, :presence => true, :format => { :with => EMAIL_REGEX, :message => "Email format is wrong" }, :uniqueness => { :message => "This email already registered"}
  validates :password, :presence => true

  def full_name
    "#{first_name} #{last_name}"
  end

end
