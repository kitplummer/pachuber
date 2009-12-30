require 'test/unit'
require File.join(File.dirname(__FILE__), '../lib/pachube.rb')
require File.join(File.dirname(__FILE__), '../resources/key.rb')
class PachubeTest < Test::Unit::TestCase
  def test_pachube_get_xml
    pach = Pachube.new(pachube_api_key)
    xml = pach.get_xml("/504.xml")
    assert xml
    eeml = Eeml.new
    eeml = XSD::Mapping.xml2obj(xml.to_s)
    assert_equal "Pachube Office environment", eeml.environment.title
  end
  
  def test_pachube_get_eeml
    pach = Pachube.new(pachube_api_key)
    eeml = Eeml.new
    eeml = pach.get_eeml("/504.xml")  
    assert eeml
    assert_equal "SOAP::Mapping::Object", eeml.class.name
    assert_equal "Pachube Office environment", eeml.environment.title
    assert_equal "office", eeml.environment.location.name
  end
end
