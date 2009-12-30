require 'rubygems'
require 'httparty'
require 'xsd/mapping'
require 'eeml'

class Pachube
  VERSION = '0.1.0'
  class PachubeError < RuntimeError; end
  
  include HTTParty
  base_uri 'http://www.pachube.com/api'
  
  def initialize(key)
    @key = key
  end
  
  def get_xml(feed_url)
    options = { :format => "xml", :headers => {"X-PachubeApiKey" => @key} }
    self.class.get(feed_url, options)
  end
  
  def get_eeml(feed_url)
    Eeml.new
    xml = self.get_xml(feed_url)
    XSD::Mapping.xml2obj(xml.to_s)
  end
  
end