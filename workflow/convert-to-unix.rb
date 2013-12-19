#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require_relative 'bundle/bundler/setup'
require_relative 'workflow_config.rb'

arg = ARGV[0]

operation_match = /(?:^win|^unix)-(.+)/.match arg

operation = operation_match[1]
path = operation_match[2]

if operation == 'win'
  match = /^([a-z]):\\(.+)/i.match path

  config = WorkflowConfig.new
  volume = config.get_volume match[1]

  path = match[2].gsub /\n|\r|\r\n/, ''
  path = path.gsub '\\', '/'

  puts "/Volumes/#{volume}/#{path}"

elsif operation == 'unix'
  match = /^\/Volumes\/([^\/]+)\/(.+)/i.match path

  config = WorkflowConfig.new
  drive = config.get_drive match[1]

  path = match[2].gsub /\n|\r|\r\n/, ''
  path = path.gsub '/', '\\'

  puts "#{drive}:\\#{path}"
end