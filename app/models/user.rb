class User < ActiveRecord::Base
  attr_accessible :emailID, :firstName, :lastName, :userName, :password, :roles
  validates :emailID,   :presence => true
  validates :firstName, :presence => true
  validates :lastName,  :presence => true
  validates :userName,  :presence => true
  validates :password,  :presence => true
  validates_uniqueness_of :userName, :emailID
  validates_length_of :userName, :within => 3..40
  validates_length_of :password, :within => 5..40
end
