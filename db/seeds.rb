# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sune = User.create :name => "Sune Simonsen"

fun = Arrangement.create

participant = Participant.new
participant.user_id = sune.id
participant.arrangement_id = fun.id
participant.save
