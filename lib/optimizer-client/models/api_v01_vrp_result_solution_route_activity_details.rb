=begin
#Optimizers API

# Unified API for multiple optimizer engines dedicated to Vehicle Routing Problems  Its purpose is to provide a complete chain for the resolution. From a provided VRP, it requires a distance matrix, solve the problem and prepare a self sufficient result.  Please check the Github Wiki for more details: [https://github.com/Mapotempo/optimizer-api/wiki](https://github.com/Mapotempo/optimizer-api/wiki) 

OpenAPI spec version: 1.7.0
Contact: tech@mapotempo.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.12

=end

require 'date'

module OptimizerClient
  class ApiV01VrpResultSolutionRouteActivityDetails
    # Means of transport used to reach this activity, it may vary within a route if subtours are defined
    attr_accessor :router_mode

    # Speed multiplier applied to the current means of transport, it may vary within a route if subtours are defined
    attr_accessor :speed_multiplier

    # 
    attr_accessor :lat

    # 
    attr_accessor :lon

    # 
    attr_accessor :skills

    # 
    attr_accessor :setup_duration

    # 
    attr_accessor :duration

    # 
    attr_accessor :additional_value

    # 
    attr_accessor :quantities

    # 
    attr_accessor :timewindows

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'router_mode' => :'router_mode',
        :'speed_multiplier' => :'speed_multiplier',
        :'lat' => :'lat',
        :'lon' => :'lon',
        :'skills' => :'skills',
        :'setup_duration' => :'setup_duration',
        :'duration' => :'duration',
        :'additional_value' => :'additional_value',
        :'quantities' => :'quantities',
        :'timewindows' => :'timewindows'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'router_mode' => :'String',
        :'speed_multiplier' => :'String',
        :'lat' => :'Float',
        :'lon' => :'Float',
        :'skills' => :'String',
        :'setup_duration' => :'Integer',
        :'duration' => :'Integer',
        :'additional_value' => :'Integer',
        :'quantities' => :'Array<ApiV01VrpResultDetailQuantities>',
        :'timewindows' => :'Array<ApiV01VrpResultSolutionRouteActivityDetailTimewindows>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'router_mode')
        self.router_mode = attributes[:'router_mode']
      end

      if attributes.has_key?(:'speed_multiplier')
        self.speed_multiplier = attributes[:'speed_multiplier']
      end

      if attributes.has_key?(:'lat')
        self.lat = attributes[:'lat']
      end

      if attributes.has_key?(:'lon')
        self.lon = attributes[:'lon']
      end

      if attributes.has_key?(:'skills')
        self.skills = attributes[:'skills']
      end

      if attributes.has_key?(:'setup_duration')
        self.setup_duration = attributes[:'setup_duration']
      end

      if attributes.has_key?(:'duration')
        self.duration = attributes[:'duration']
      end

      if attributes.has_key?(:'additional_value')
        self.additional_value = attributes[:'additional_value']
      end

      if attributes.has_key?(:'quantities')
        if (value = attributes[:'quantities']).is_a?(Array)
          self.quantities = value
        end
      end

      if attributes.has_key?(:'timewindows')
        if (value = attributes[:'timewindows']).is_a?(Array)
          self.timewindows = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          router_mode == o.router_mode &&
          speed_multiplier == o.speed_multiplier &&
          lat == o.lat &&
          lon == o.lon &&
          skills == o.skills &&
          setup_duration == o.setup_duration &&
          duration == o.duration &&
          additional_value == o.additional_value &&
          quantities == o.quantities &&
          timewindows == o.timewindows
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [router_mode, speed_multiplier, lat, lon, skills, setup_duration, duration, additional_value, quantities, timewindows].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = OptimizerClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
