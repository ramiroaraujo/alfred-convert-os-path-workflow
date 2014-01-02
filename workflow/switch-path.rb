#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'bundle/bundler/setup'
require_relative 'workflow_config.rb'

arg = ARGV[0]

operation_match = /(^win|^unix)-(.+)/.match arg

operation = operation_match[1]
path = operation_match[2].strip

if operation == 'unix'
  match = /^([a-z]):\\(.+)/i.match path

  config = WorkflowConfig.new
  volume = config.get_volume match[1]

  path = match[2].gsub /\s*\\\s*/, '/'

  print "/Volumes/#{volume}/#{path}"

elsif operation == 'win'
  match = /^\/Volumes\/([^\/]+)\/(.+)/i.match path

  config = WorkflowConfig.new
  drive = config.get_drive match[1]

  path = match[2].gsub /\s*\/\s*/, '\\'

  print "#{drive}:\\#{path}"
end
