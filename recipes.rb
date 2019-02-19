#! /usr/bin/env ruby

require 'json'

recipes = JSON.load(File.read('recipes.json'))
ingredients = Hash.new
ingredients.default = 0

labels = Hash.new
labels.default = 0

puts recipes.count

recipes.each do |recipe|
  recipe['ingredients'].each do |ingredient|
    next if ingredient['special']
    ingredients[ingredient['ingredient']] += 1
    labels[ingredient['label']] += 1
  end
end

ingredients.each do |ingredient, count|
  puts "#{ingredient}: #{count}"
end
