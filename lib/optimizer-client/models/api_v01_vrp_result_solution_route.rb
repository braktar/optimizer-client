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
  class ApiV01VrpResultSolutionRoute
    # Internal reference of the vehicule used for the current route
    attr_accessor :vehicle_id

    # Every step of the route
    attr_accessor :activities

    # Sum of every travel time within the route (in s)
    attr_accessor :total_travel_time

    # Sum of every distance within the route (in m)
    attr_accessor :total_distance

    # Sum of every travel time and activity duration of the route (in s)
    attr_accessor :total_time

    # Sum of every idle time within the route (in s)
    attr_accessor :total_waiting_time

    # Give the actual start time of the current route if provided by the solve
    attr_accessor :start_time

    # Give the actual end time of the current route if provided by the solver
    attr_accessor :end_time

    # Contains the geometry of the route, if asked in first place
    attr_accessor :geometry

    # Give the actual initial loads of the route
    attr_accessor :initial_loads

    # The impact of the current route within the solution cost
    attr_accessor :cost_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'vehicle_id' => :'vehicle_id',
        :'activities' => :'activities',
        :'total_travel_time' => :'total_travel_time',
        :'total_distance' => :'total_distance',
        :'total_time' => :'total_time',
        :'total_waiting_time' => :'total_waiting_time',
        :'start_time' => :'start_time',
        :'end_time' => :'end_time',
        :'geometry' => :'geometry',
        :'initial_loads' => :'initial_loads',
        :'cost_details' => :'cost_details'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'vehicle_id' => :'String',
        :'activities' => :'Array<ApiV01VrpResultSolutionRouteActivities>',
        :'total_travel_time' => :'Integer',
        :'total_distance' => :'Integer',
        :'total_time' => :'Integer',
        :'total_waiting_time' => :'Integer',
        :'start_time' => :'Integer',
        :'end_time' => :'Integer',
        :'geometry' => :'String',
        :'initial_loads' => :'Array<ApiV01VrpResultDetailQuantities>',
        :'cost_details' => :'ApiV01VRPResultDetailedCosts'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'vehicle_id')
        self.vehicle_id = attributes[:'vehicle_id']
      end

      if attributes.has_key?(:'activities')
        if (value = attributes[:'activities']).is_a?(Array)
          self.activities = value
        end
      end

      if attributes.has_key?(:'total_travel_time')
        self.total_travel_time = attributes[:'total_travel_time']
      end

      if attributes.has_key?(:'total_distance')
        self.total_distance = attributes[:'total_distance']
      end

      if attributes.has_key?(:'total_time')
        self.total_time = attributes[:'total_time']
      end

      if attributes.has_key?(:'total_waiting_time')
        self.total_waiting_time = attributes[:'total_waiting_time']
      end

      if attributes.has_key?(:'start_time')
        self.start_time = attributes[:'start_time']
      end

      if attributes.has_key?(:'end_time')
        self.end_time = attributes[:'end_time']
      end

      if attributes.has_key?(:'geometry')
        self.geometry = attributes[:'geometry']
      end

      if attributes.has_key?(:'initial_loads')
        if (value = attributes[:'initial_loads']).is_a?(Array)
          self.initial_loads = value
        end
      end

      if attributes.has_key?(:'cost_details')
        self.cost_details = attributes[:'cost_details']
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
          vehicle_id == o.vehicle_id &&
          activities == o.activities &&
          total_travel_time == o.total_travel_time &&
          total_distance == o.total_distance &&
          total_time == o.total_time &&
          total_waiting_time == o.total_waiting_time &&
          start_time == o.start_time &&
          end_time == o.end_time &&
          geometry == o.geometry &&
          initial_loads == o.initial_loads &&
          cost_details == o.cost_details
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [vehicle_id, activities, total_travel_time, total_distance, total_time, total_waiting_time, start_time, end_time, geometry, initial_loads, cost_details].hash
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
