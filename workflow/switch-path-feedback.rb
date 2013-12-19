#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require_relative 'bundle/bundler/setup'
require 'alfred'
require_relative 'workflow_config.rb'

path = ARGV[0]

Alfred.with_friendly_error do |alfred|

  fb = alfred.feedback

  config = WorkflowConfig.new

  # detect if windows or unix path
  to_unix = /^([a-z]):\\/i.match path
  to_win = /\/Volumes\//i.match path

  if to_unix
    if !config.has_drive? to_unix[1]
      # error, no config for this windows drive
      fb.add_item({
                      :title => 'There\'s no mapping configured for this Windows drive',
                      :valid => 'no',
                  })
    else
      # ok to convert
      fb.add_item({
                      :title => 'Press ENTER con convert the path',
                      :subtitle => 'It will copy the converted path to the clipboard',
                      :arg => path,
                      :valid => 'yes',
                  })
    end
  elsif to_win
    if !config.has_volume? to_win[1]
      # error, no config for this unix volume
      fb.add_item({
                      :title => 'There\'s no mapping configured for this UNIX Volume',
                      :valid => 'no',
                  })
    else
      # ok to convert
      fb.add_item({
                      :title => 'Press ENTER con convert the path',
                      :subtitle => 'It will copy the converted path to the clipboard',
                      :arg => path,
                      :valid => 'yes',
                  })
    end
  else
    # invalid syntax
    fb.add_item({
                    :title => 'Incorrect Windows or UNIX Path',
                    :subtitle => 'Make sure it starts with a Drive letter for Windows, or /Volumes/... for UNIX',
                    :valid => 'no',
                })
  end

  puts fb.to_xml()
end