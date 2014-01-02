#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require 'bundle/bundler/setup'
require 'alfred'
require 'workflow_config.rb'

win_drive = ARGV[0]
unix_volume = ARGV[1]

Alfred.with_friendly_error do |alfred|

  fb = alfred.feedback

  config = WorkflowConfig.new

  valid_win_drive = false
  valid_unix_volume = false

  if !win_drive && !unix_volume
    fb.add_item({
                    :uid => '',
                    :title => 'Please enter a Windows drive letter followed by a space and a UNIX volume name',
                    :arg => '',
                    :valid => 'no',
                })
  else
    valid_win_drive = win_drive =~ /^[a-z]$/i
    existent_win_drive = config.has_drive? win_drive
    valid_unix_volume = unix_volume
    existent_unix_volume = config.has_volume? unix_volume

    if !valid_win_drive
      fb.add_item({
                      :title => 'Enter a valid Windows drive letter',
                      :valid => 'no',
                  })
    elsif existent_win_drive
      fb.add_item({
                      :title => 'The Windows Drive already has a mapping configured',
                      :valid => 'no',
                  })

    elsif !valid_unix_volume
      fb.add_item({
                      :title => 'Enter a valid UNIX volume name',
                      :valid => 'no',
                  })
    elsif existent_unix_volume
      fb.add_item({
                      :title => 'The UNIX volume already has a mapping configured',
                      :valid => 'no',
                  })
    else
      fb.add_item({
                      :title => 'Press ENTER to create the current configuration',
                      :subtitle => "would map Windows drive #{win_drive.upcase}: to UNIX Volume #{unix_volume}",
                      :arg => "#{win_drive.upcase} #{unix_volume}",
                      :valid => 'yes',
                  })
    end
  end

  puts fb.to_xml()
end