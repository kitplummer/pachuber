require 'rubygems'
require 'httparty'
require 'eeml'

class Pachube
  VERSION = '0.1.1'
  class PachubeError < RuntimeError; end
  
  # Using HTTParty to hide the REST/HTTP interface
  include HTTParty
  
  # The Pachube API.  Sure hope they don't change the URL.
  base_uri 'http://www.pachube.com/api'
  
  def initialize(key)
    @key = key
  end
  
  # Fetches the Pachube feed
  # Returns the latest datastream entry as XML
  def get_xml(feed_url)
    options = { :format => "xml", :headers => {"X-PachubeApiKey" => @key} }
    self.class.get(feed_url, options)
  end
  
  # Fetches the Pachube feed
  # Returns the latest datastream entry as EEML::Environment object
  def get_eeml(feed_url)
    xml = self.get_xml(feed_url)
    eeml = EEML::Environment.from_eeml(xml)
  end
  
  # Posts an update to a specified Pachube feed 
  def update(feed_url, eeml)
    options = { :headers => {"X-PachubeApiKey" => @key},
                :body => eeml 
              }
    self.class.put(feed_url, options)
  end
end