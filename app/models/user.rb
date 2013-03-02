class User < ActiveRecord::Base
  include ActiveModel::SecurePassword::InstanceMethodsOnActivation
  has_secure_password
  attr_accessible :password, :password_confirmation, :userName, :firstName, :lastName, :emailID, :roles
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
  validates :emailID,   :presence => true, :format => EMAIL_REGEX
  validates :firstName, :presence => true
  validates :lastName,  :presence => true
  validates :userName,  :presence => true
  validates_uniqueness_of :userName, :emailID
  validates_length_of :userName, :within => 3..40
  validates_presence_of :password, :on => :create

  def before_save 
    if (self.salt == nil) 
      self.salt = random_numbers(5) 
      self.password = Digest::MD5.hexdigest(self.salt + self.password) 
    end 
  end

  private   
  # A sequence of random numbers with no skewing of range in any particular 
  # direction and leading zeros preserved. 
  def random_numbers(len) 
    numbers = ("0".."9").to_a 
    newrand = "" 
    1.upto(len) { |i| newrand << numbers[rand(numbers.size - 1)] } 
    return newrand 
  end

end
