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
    @config.each { |win, unix| arr << {'win' => win, 'unix' => unix} } if @config
    arr
  end

  def has_drive? drive
    @config.has_key? drive if @config
  end

  def has_volume? volume
    @config.has_value? volume if @config
  end

  def get_volume drive
    @config[drive]
  end

  def get_drive volume
    @config.key volume
  end

  def load_config
    @config = YAML.load File.open 'config.yml'
    @config = Hash.new if !@config
  end

  def write_config
    File.open('config.yml', "w") { |f| f.write(@config.to_yaml) }
  end

  private :load_config
end