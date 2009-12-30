require 'xsd/qname'

# {http://www.eeml.org/xsd/005}eeml
#   environment - Eeml::Environment
#   xmlattr_version - SOAP::SOAPPositiveInteger
class Eeml
  AttrVersion = XSD::QName.new(nil, "version")

  # inner class for member: environment
  # {http://www.eeml.org/xsd/005}environment
  #   title - SOAP::SOAPString
  #   feed - SOAP::SOAPAnyURI
  #   status - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   icon - SOAP::SOAPAnyURI
  #   website - SOAP::SOAPAnyURI
  #   email - SOAP::SOAPString
  #   location - Eeml::Environment::Location
  #   data - Eeml::Environment::C_Data
  #   xmlattr_updated - SOAP::SOAPDateTime
  #   xmlattr_creator - SOAP::SOAPString
  #   xmlattr_id - SOAP::SOAPNonNegativeInteger
  class Environment
    AttrCreator = XSD::QName.new(nil, "creator")
    AttrId = XSD::QName.new(nil, "id")
    AttrUpdated = XSD::QName.new(nil, "updated")

    # inner class for member: location
    # {http://www.eeml.org/xsd/005}location
    #   name - SOAP::SOAPString
    #   lat - SOAP::SOAPDouble
    #   lon - SOAP::SOAPDouble
    #   ele - SOAP::SOAPDouble
    #   xmlattr_exposure - SOAP::SOAPString
    #   xmlattr_domain - SOAP::SOAPString
    #   xmlattr_disposition - SOAP::SOAPString
    class Location
      AttrDisposition = XSD::QName.new(nil, "disposition")
      AttrDomain = XSD::QName.new(nil, "domain")
      AttrExposure = XSD::QName.new(nil, "exposure")

      attr_accessor :name
      attr_accessor :lat
      attr_accessor :lon
      attr_accessor :ele

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_exposure
        __xmlattr[AttrExposure]
      end

      def xmlattr_exposure=(value)
        __xmlattr[AttrExposure] = value
      end

      def xmlattr_domain
        __xmlattr[AttrDomain]
      end

      def xmlattr_domain=(value)
        __xmlattr[AttrDomain] = value
      end

      def xmlattr_disposition
        __xmlattr[AttrDisposition]
      end

      def xmlattr_disposition=(value)
        __xmlattr[AttrDisposition] = value
      end

      def initialize(name = nil, lat = nil, lon = nil, ele = nil)
        @name = name
        @lat = lat
        @lon = lon
        @ele = ele
        @__xmlattr = {}
      end
    end

    # inner class for member: data
    # {http://www.eeml.org/xsd/005}data
    #   tag - SOAP::SOAPString
    #   value - Eeml::Environment::C_Data::Value
    #   unit - Eeml::Environment::C_Data::Unit
    #   xmlattr_id - SOAP::SOAPNonNegativeInteger
    class C_Data
      AttrId = XSD::QName.new(nil, "id")

      # inner class for member: value
      # {http://www.eeml.org/xsd/005}value
      #   xmlattr_minValue - SOAP::SOAPString
      #   xmlattr_maxValue - SOAP::SOAPString
      class Value < ::String
        AttrMaxValue = XSD::QName.new(nil, "maxValue")
        AttrMinValue = XSD::QName.new(nil, "minValue")

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_minValue
          __xmlattr[AttrMinValue]
        end

        def xmlattr_minValue=(value)
          __xmlattr[AttrMinValue] = value
        end

        def xmlattr_maxValue
          __xmlattr[AttrMaxValue]
        end

        def xmlattr_maxValue=(value)
          __xmlattr[AttrMaxValue] = value
        end

        def initialize(*arg)
          super
          @__xmlattr = {}
        end
      end

      # inner class for member: unit
      # {http://www.eeml.org/xsd/005}unit
      #   xmlattr_symbol - SOAP::SOAPString
      #   xmlattr_type - SOAP::SOAPString
      class Unit < ::String
        AttrC_Symbol = XSD::QName.new(nil, "symbol")
        AttrType = XSD::QName.new(nil, "type")

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_symbol
          __xmlattr[AttrC_Symbol]
        end

        def xmlattr_symbol=(value)
          __xmlattr[AttrC_Symbol] = value
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def initialize(*arg)
          super
          @__xmlattr = {}
        end
      end

      attr_accessor :tag
      attr_accessor :value
      attr_accessor :unit

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_id
        __xmlattr[AttrId]
      end

      def xmlattr_id=(value)
        __xmlattr[AttrId] = value
      end

      def initialize(tag = [], value = nil, unit = nil)
        @tag = tag
        @value = value
        @unit = unit
        @__xmlattr = {}
      end
    end

    attr_accessor :title
    attr_accessor :feed
    attr_accessor :status
    attr_accessor :description
    attr_accessor :icon
    attr_accessor :website
    attr_accessor :email
    attr_accessor :location
    attr_accessor :data

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_updated
      __xmlattr[AttrUpdated]
    end

    def xmlattr_updated=(value)
      __xmlattr[AttrUpdated] = value
    end

    def xmlattr_creator
      __xmlattr[AttrCreator]
    end

    def xmlattr_creator=(value)
      __xmlattr[AttrCreator] = value
    end

    def xmlattr_id
      __xmlattr[AttrId]
    end

    def xmlattr_id=(value)
      __xmlattr[AttrId] = value
    end

    def initialize(title = nil, feed = nil, status = nil, description = nil, icon = nil, website = nil, email = nil, location = nil, data = [])
      @title = title
      @feed = feed
      @status = status
      @description = description
      @icon = icon
      @website = website
      @email = email
      @location = location
      @data = data
      @__xmlattr = {}
    end
  end

  attr_accessor :environment

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_version
    __xmlattr[AttrVersion]
  end

  def xmlattr_version=(value)
    __xmlattr[AttrVersion] = value
  end

  def initialize(environment = [])
    @environment = environment
    @__xmlattr = {}
  end
end
