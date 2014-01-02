#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require 'bundle/bundler/setup'
require 'workflow_config.rb'

win_drive = ARGV[0]
unix_volume = ARGV[1]

config = WorkflowConfig.new
config.add win_drive, unix_volume
config.write_config

puts "Mapped #{win_drive}: to /Volumes/#{unix_volume}"
