require 'rubygems'
require 'bundler/setup'

require 'mongoid'
require 'mongoid/localization'
require 'rspec'
require 'rspec/autorun'


RSpec.configure do |config|
  config.after :each do
    Mongoid.master.collections.reject { |c| c.name =~ /^system\./ }.each(&:drop)
  end
end

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db('mongoid_localization_test')
  config.allow_dynamic_fields = false
end