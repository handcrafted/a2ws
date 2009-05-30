require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'yaml'
require 'pp'

include A2WS

config = YAML::load(open(ENV['HOME'] + '/.a2ws'))
access_key = config["access_key"]

describe "A2WS Operations" do

  describe "ItemSearch" do

    it "should require SearchIndex" do
      search = ItemSearch.new(access_key, nil)
      result = search.query
      result['Request']['IsValid'].should == 'False'
    end

    it "should find some items" do
      search = ItemSearch.new(access_key, :Books)
      search.query(:query => {:Title => 'Harry Potter'}).size.should_not == 0
    end

  end
end
