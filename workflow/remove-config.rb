#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require_relative 'bundle/bundler/setup'
require_relative 'workflow_config.rb'

win_drive = ARGV[0]
unix_volume = ARGV[1]

config = WorkflowConfig.new
config.remove win_drive
config.write_config

puts "Removed mapping between #{win_drive}: and /Volumes/#{unix_volume}"
