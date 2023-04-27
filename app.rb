require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/Show'
require_relative 'lib/Game'
require_relative 'lib/Player'
require_relative 'lib/Board'
require_relative 'lib/BoardCase'
require_relative 'lib/Application'

Application.new.perform

