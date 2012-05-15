# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fun = Arrangement.find_by_name("Fun")
if fun 
    fun.destroy
end

fun = Arrangement.create :name => "Fun"

sune = fun.participants.build(:name => "Sune Simonsen")
sune.save
sune.expenses.build(:name => "Beer", :amount => 1000).save
sune.expenses.build(:name => "Chips", :amount => 300).save

dan = fun.participants.build(:name => "Dan Søndergaard")
dan.save
dan.expenses.build(:name => "Kayak", :amount => 2400).save
dan.expenses.build(:name => "Sandwiches", :amount => 450).save

fun.save
