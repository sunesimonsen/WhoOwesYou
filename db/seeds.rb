# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fun = Arrangement.find_by_name("Fun")
if 
    fun.destroy
end


sune = User.create :name => "Sune Simonsen"
dan = User.create :name => "Dan Søndergaard"

fun = Arrangement.create :name => "Fun"

participant = Participant.new
participant.user_id = sune.id
participant.arrangement_uuid = fun.uuid
participant.save

beer = Expense.new(:name => "Beer", :amount => 1000)
beer.participant_id = participant.id
beer.save

chips = Expense.new(:name => "Chips", :amount => 300)
chips.participant_id = participant.id
chips.save

participant = Participant.new
participant.user_id = dan.id
participant.arrangement_uuid = fun.uuid
participant.save

beer = Expense.new(:name => "Kayak", :amount => 2400)
beer.participant_id = participant.id
beer.save

chips = Expense.new(:name => "Sandwiches", :amount => 450)
chips.participant_id = participant.id
chips.save
