require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'yaml'

include A2WS

config = YAML::load(open(ENV['HOME'] + '/.a2ws'))
access_key = config["access_key"]

A2WS::Base.configure do |config|
  config.api_key = access_key
end

describe "A2WS Operations" do

  describe "ItemSearch" do

    it "should require SearchIndex" do
      search = ItemSearch.new
      lambda { search.find }.should raise_error
    end

    it "should find some items" do
      search = ItemSearch.new(:Books)
      search.find(nil, :Title => 'Harry Potter').size.should_not == 0
    end

  end
end
