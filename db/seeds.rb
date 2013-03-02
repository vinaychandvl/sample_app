# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create!(:userName => "arthi", :firstName => "arthi", :lastName => "raja", :emailID => "arthi@arthi.com",:password => "foobar", :password_confirmation => "foobar", :roles => "admin")
User.create!(:userName => "vinay", :firstName => "vinay", :lastName => "chand", :emailID => "vinay@vinay.com", :password => "foobar", :password_confirmation => "foobar", :roles => "admin")
User.create!(:userName => "user1", :firstName => "ajit", :lastName => "chakrapani", :emailID => "user1@foo.com", :password => "foobar", :password_confirmation => "foobar", :roles => "admin")
User.create!(:userName => "foo", :firstName => "foo", :lastName => "bar", :emailID => "foo@bar.com",:password => "foobar", :password_confirmation => "foobar", :roles => "admin")
User.create!(:userName => "user15", :firstName => "15user", :lastName => "test15", :emailID => "user15@foo.com",:password => "foobar", :password_confirmation => "foobar", :roles => "admin")
User.create!(:userName => "user999", :firstName => "user", :lastName => "999test", :emailID => "uesr999@foo.com",:password => "foobar", :password_confirmation => "foobar", :roles => "admin")
User.create!(:userName => "ajit", :firstName => "ajit", :lastName => "chakrapani", :emailID => "ajit@ajit.com", :password => "foobar", :password_confirmation => "foobar", :roles => "admin")