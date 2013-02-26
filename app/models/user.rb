class User < ActiveRecord::Base
  attr_accessible :emailID, :firstName, :lastName, :userName, :password, :roles
  validates :emailID,  :presence => true
  validates :firstName, :presence => true
  validates :lastName,  :presence => true
  validates :userName, :presence => true
  validates :password,  :presence => true
end
