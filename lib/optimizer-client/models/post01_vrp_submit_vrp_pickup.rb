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
  # Activity of collection
  class Post01VrpSubmitVrpPickup
    # Provides an indication on when to do this service among whole route
    attr_accessor :position

    # Time while the current activity stands until it's over (in seconds)
    attr_accessor :duration

    # Additional value associated to the visit
    attr_accessor :additional_value

    # Time at destination before the proper activity is effectively performed
    attr_accessor :setup_duration

    # (ORtools only) Overrides the late_multiplier defined at the vehicle level
    attr_accessor :late_multiplier

    # Reference to the associated point
    attr_accessor :point_id

    # Time slot while the activity may start
    attr_accessor :timewindows

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
        :'position' => :'position',
        :'duration' => :'duration',
        :'additional_value' => :'additional_value',
        :'setup_duration' => :'setup_duration',
        :'late_multiplier' => :'late_multiplier',
        :'point_id' => :'point_id',
        :'timewindows' => :'timewindows'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'position' => :'String',
        :'duration' => :'Integer',
        :'additional_value' => :'Integer',
        :'setup_duration' => :'Integer',
        :'late_multiplier' => :'Float',
        :'point_id' => :'String',
        :'timewindows' => :'Array<Post01VrpSubmitVrpTimewindows>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'position')
        self.position = attributes[:'position']
      else
        self.position = 'neutral'
      end

      if attributes.has_key?(:'duration')
        self.duration = attributes[:'duration']
      else
        self.duration = 0
      end

      if attributes.has_key?(:'additional_value')
        self.additional_value = attributes[:'additional_value']
      end

      if attributes.has_key?(:'setup_duration')
        self.setup_duration = attributes[:'setup_duration']
      else
        self.setup_duration = 0
      end

      if attributes.has_key?(:'late_multiplier')
        self.late_multiplier = attributes[:'late_multiplier']
      end

      if attributes.has_key?(:'point_id')
        self.point_id = attributes[:'point_id']
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
      if @point_id.nil?
        invalid_properties.push('invalid value for "point_id", point_id cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      position_validator = EnumAttributeValidator.new('String', ['neutral', 'always_first', 'always_middle', 'always_last', 'never_first', 'never_middle', 'never_last'])
      return false unless position_validator.valid?(@position)
      return false if @point_id.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] position Object to be assigned
    def position=(position)
      validator = EnumAttributeValidator.new('String', ['neutral', 'always_first', 'always_middle', 'always_last', 'never_first', 'never_middle', 'never_last'])
      unless validator.valid?(position)
        fail ArgumentError, 'invalid value for "position", must be one of #{validator.allowable_values}.'
      end
      @position = position
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          position == o.position &&
          duration == o.duration &&
          additional_value == o.additional_value &&
          setup_duration == o.setup_duration &&
          late_multiplier == o.late_multiplier &&
          point_id == o.point_id &&
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
      [position, duration, additional_value, setup_duration, late_multiplier, point_id, timewindows].hash
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
