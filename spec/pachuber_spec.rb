require 'spec_helper'
require 'nokogiri'


require File.join(File.dirname(__FILE__), '../resources/key.rb')

describe Pachube do

  it "should return XML" do
    pach = Pachube.new(KEY)
    xml = pach.get_xml("/504.xml")
    xml.should_not == nil
    "Pachube Office environment".should ==
      Nokogiri::XML.parse(xml).css('title').text.to_s
  end

  it "should return EEML" do
    pach = Pachube.new(KEY)
    eeml = pach.get_eeml("/504.xml")  
    eeml.should_not == nil
    "EEML::Environment".should == eeml.class.name
    "office".should == eeml.location.name
  end

  it "should update with a post" do
    env = EEML::Environment.new
    env << EEML::Data.new(42, :id => "ABC123")
    pach = Pachube.new(KEY)
    resp = pach.update("/4078.xml", env.to_eeml)
    resp.code.should == 200
  end
  
end
