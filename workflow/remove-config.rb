#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'bundle/bundler/setup'
require_relative 'workflow_config.rb'

win_drive = ARGV[0]

config = WorkflowConfig.new
unix_volume = config.get_volume win_drive
config.remove win_drive
config.write_config

puts "Removed mapping between #{win_drive}: and /Volumes/#{unix_volume}"