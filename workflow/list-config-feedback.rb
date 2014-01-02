#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require 'bundle/bundler/setup'
require 'alfred'
require 'workflow_config.rb'

value = ARGV[0]

Alfred.with_friendly_error do |alfred|

  fb = alfred.feedback

  config = WorkflowConfig.new

  config.list.each do |drive|

    next if value && (!(drive['win'] =~ /#{value}/i) && !(drive['unix'] =~ /#{value}/i))

    fb.add_item({
                    :uid => "",
                    :title => "#{drive['win']}:\\ ➡ /Volumes/#{drive['unix']}",
                    :subtitle => "Mapped Windows drive #{drive['win']}: to UNIX volume #{drive['unix']}",
                    :arg => "#{drive['win']} #{drive['unix']}",
                    :valid => "yes",
                })
  end

  if fb.to_xml().to_s == '<items/>'
    if (value)
      fb.add_item({
                      :uid => '',
                      :title => 'No results for your search',
                      :arg => '',
                      :valid => 'no',
                  })

    else
      fb.add_item({
                      :uid => '',
                      :title => 'No mapped config',
                      :arg => '',
                      :valid => 'no',
                  })

    end
  end


  puts fb.to_xml()
end