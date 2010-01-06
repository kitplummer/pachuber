require 'rubygems'
require 'test/unit'
require 'nokogiri'

require File.join(File.dirname(__FILE__), '../lib/pachube.rb')
# The pachube_api_key needs to be your Pachube API key.
# I happen to store mine in a key.rb file in resources/.
require File.join(File.dirname(__FILE__), '../resources/key.rb')
class PachubeTest < Test::Unit::TestCase

  def test_pachube_get_xml
    pach = Pachube.new(pachube_api_key)
    xml = pach.get_xml("/504.xml")
    assert xml
    assert_equal "Pachube Office environment",
    Nokogiri::XML.parse(xml).css('title').text.to_s
  end

  def test_pachube_get_eeml
    pach = Pachube.new(pachube_api_key)
    eeml = pach.get_eeml("/504.xml")  
    assert eeml
    assert_equal "EEML::Environment", eeml.class.name
    assert_equal "office", eeml.location.name
  end

  def test_pachube_update_post
    env = EEML::Environment.new
    env << EEML::Data.new(42, :id => "ABC123")
    pach = Pachube.new(pachube_api_key)
    resp = pach.update("/4078.xml", env.to_eeml)
    assert_equal 200, resp.code
  end
  
end
