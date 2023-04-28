require 'pry'
require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
# reste à indiquer les require sans précision du chemin

require 'show'
require 'player'
require 'board'
require 'game'
require 'boardcase'
require 'application'

Application.new.perform





