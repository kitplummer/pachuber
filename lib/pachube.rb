require 'rubygems'
require 'httparty'
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
    xml = self.get_xml(feed_url)
    eeml = EEML::Environment.from_eeml(xml)
  end
  
  def update(feed_url, eeml)
    options = { :headers => {"X-PachubeApiKey" => @key},
                :body => eeml 
              }
    self.class.put(feed_url, options)
  end
end