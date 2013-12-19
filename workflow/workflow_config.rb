require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require_relative 'bundle/bundler/setup'
require 'alfred'
require 'yaml'

class WorkflowConfig

  @config

  def initialize
    load_config
  end

  def add win_drive, unix_volume
    @config[win_drive] = unix_volume if !@config.has_key? win_drive
  end

  def remove win_drive
    @config.delete win_drive if @config.has_key? win_drive
  end

  def list
    arr = []
    @config.each { |win, unix| arr << {'win' => win, 'unix' => unix} }
    arr
  end

  def has_drive? drive
    @config.has_key? drive
  end

  def has_volume? volume
    @config.has_value? volume
  end

  def load_config
    #init configuration file, create new if inexistent
    File.new 'config.yml' if !File.exists? 'config.yml'
    @config = YAML.load File.open 'config.yml'
  end

  def write_config
    File.open('config.yml', "w") { |f| f.write(@config.to_yaml) }
  end

  private :load_config
end