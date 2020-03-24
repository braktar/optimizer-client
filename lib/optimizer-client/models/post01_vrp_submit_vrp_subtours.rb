=begin
#Optimizers API

# Unified API for multiple optimizer engines dedicated to Vehicle Routing Problems  Its purpose is to provide a complete chain for the resolution. From a provided VRP, it requires a distance matrix, solve the problem and prepare a self sufficient result.  Please check the Github Wiki for more details: [https://github.com/Mapotempo/optimizer-api/wiki](https://github.com/Mapotempo/optimizer-api/wiki) 

OpenAPI spec version: 0.1.5
Contact: tech@mapotempo.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.12

=end

require 'date'

module OptimizerClient
  class Post01VrpSubmitVrpSubtours
    attr_accessor :id

    # Time limit from the transmodal points (Isochrone)
    attr_accessor :time_bounds

    # Distance limit from the transmodal points (Isodistanche)
    attr_accessor :distance_bounds

    # car, truck, bicycle...etc. See the Router Wrapper API doc
    attr_accessor :router_mode

    # time or dimension, choose between a matrix based on minimal route duration or on minimal route distance
    attr_accessor :router_dimension

    # multiply the current modality speed, default : 1.0
    attr_accessor :speed_multiplier

    # Particular abilities required by a vehicle to perform this subtour
    attr_accessor :skills

    # Maximum subtour duration
    attr_accessor :duration

    # Point where the vehicles can park and start the subtours
    attr_accessor :transmodal_stops

    # Define the limit of entities the subtour modality can handle
    attr_accessor :capacities

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'time_bounds' => :'time_bounds',
        :'distance_bounds' => :'distance_bounds',
        :'router_mode' => :'router_mode',
        :'router_dimension' => :'router_dimension',
        :'speed_multiplier' => :'speed_multiplier',
        :'skills' => :'skills',
        :'duration' => :'duration',
        :'transmodal_stops' => :'transmodal_stops',
        :'capacities' => :'capacities'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'String',
        :'time_bounds' => :'Integer',
        :'distance_bounds' => :'Integer',
        :'router_mode' => :'String',
        :'router_dimension' => :'String',
        :'speed_multiplier' => :'Float',
        :'skills' => :'Array<String>',
        :'duration' => :'Integer',
        :'transmodal_stops' => :'Array<Post01VrpSubmitVrpPoints>',
        :'capacities' => :'Array<Post01VrpSubmitVrpCapacities>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'time_bounds')
        self.time_bounds = attributes[:'time_bounds']
      end

      if attributes.has_key?(:'distance_bounds')
        self.distance_bounds = attributes[:'distance_bounds']
      end

      if attributes.has_key?(:'router_mode')
        self.router_mode = attributes[:'router_mode']
      end

      if attributes.has_key?(:'router_dimension')
        self.router_dimension = attributes[:'router_dimension']
      end

      if attributes.has_key?(:'speed_multiplier')
        self.speed_multiplier = attributes[:'speed_multiplier']
      else
        self.speed_multiplier = 1.0
      end

      if attributes.has_key?(:'skills')
        if (value = attributes[:'skills']).is_a?(Array)
          self.skills = value
        end
      end

      if attributes.has_key?(:'duration')
        self.duration = attributes[:'duration']
      end

      if attributes.has_key?(:'transmodal_stops')
        if (value = attributes[:'transmodal_stops']).is_a?(Array)
          self.transmodal_stops = value
        end
      end

      if attributes.has_key?(:'capacities')
        if (value = attributes[:'capacities']).is_a?(Array)
          self.capacities = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @id.nil?
      router_dimension_validator = EnumAttributeValidator.new('String', ['time', 'distance'])
      return false unless router_dimension_validator.valid?(@router_dimension)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] router_dimension Object to be assigned
    def router_dimension=(router_dimension)
      validator = EnumAttributeValidator.new('String', ['time', 'distance'])
      unless validator.valid?(router_dimension)
        fail ArgumentError, 'invalid value for "router_dimension", must be one of #{validator.allowable_values}.'
      end
      @router_dimension = router_dimension
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          time_bounds == o.time_bounds &&
          distance_bounds == o.distance_bounds &&
          router_mode == o.router_mode &&
          router_dimension == o.router_dimension &&
          speed_multiplier == o.speed_multiplier &&
          skills == o.skills &&
          duration == o.duration &&
          transmodal_stops == o.transmodal_stops &&
          capacities == o.capacities
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, time_bounds, distance_bounds, router_mode, router_dimension, speed_multiplier, skills, duration, transmodal_stops, capacities].hash
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
