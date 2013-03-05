class User < ActiveRecord::Base
  include ActiveModel::SecurePassword::InstanceMethodsOnActivation
  attr_accessible :password, :password_confirmation, :userName, :firstName, :lastName, :emailID, :roles
  has_secure_password
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
  validates :emailID,   :presence => true, :format => EMAIL_REGEX
  validates :firstName, :presence => true
  validates :lastName,  :presence => true
  validates :userName,  :presence => true, :uniqueness => { case_sensitive: false}
  validates_uniqueness_of :userName, :emailID, :uniqueness => { case_sensitive: false}
  validates_length_of :userName, :within => 3..40
  validates_length_of :password, :on => :create, :in => 6..16
  validates_presence_of :password, :on => :create 
  validates_presence_of :password_confirmation, :on => :create 

  def is_admin?
    self.roles.gsub(" ","").split(',').include?('admin')    
  end

end
