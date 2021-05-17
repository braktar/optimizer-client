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
  class ApiV01VrpResultSolution
    # When first_solution_strategies are provided, sum up of tryied heuristics and their performance.
    attr_accessor :heuristic_synthesis

    # Solvers used to perform the optimization
    attr_accessor :solvers

    # The actual cost of the solution considering all costs
    attr_accessor :cost

    # The detail of the different costs which impact the solution
    attr_accessor :cost_details

    # Total number of iteration performed to obtain the current result
    attr_accessor :iterations

    # cumulated distance of every route (in m)
    attr_accessor :total_distance

    # Cumulated time of every route (in s)
    attr_accessor :total_time

    # Cumulated travel time of every route (in s)
    attr_accessor :total_travel_time

    # Cumulated idle time of every route (in s)
    attr_accessor :total_waiting_time

    # All the route calculated
    attr_accessor :routes

    # Jobs which are not part of the solution
    attr_accessor :unassigned

    # Elapsed time within solver in ms
    attr_accessor :elapsed

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'heuristic_synthesis' => :'heuristic_synthesis',
        :'solvers' => :'solvers',
        :'cost' => :'cost',
        :'cost_details' => :'cost_details',
        :'iterations' => :'iterations',
        :'total_distance' => :'total_distance',
        :'total_time' => :'total_time',
        :'total_travel_time' => :'total_travel_time',
        :'total_waiting_time' => :'total_waiting_time',
        :'routes' => :'routes',
        :'unassigned' => :'unassigned',
        :'elapsed' => :'elapsed'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'heuristic_synthesis' => :'Object',
        :'solvers' => :'Array<String>',
        :'cost' => :'Float',
        :'cost_details' => :'ApiV01VRPResultDetailedCosts',
        :'iterations' => :'Integer',
        :'total_distance' => :'Integer',
        :'total_time' => :'Integer',
        :'total_travel_time' => :'Integer',
        :'total_waiting_time' => :'Integer',
        :'routes' => :'Array<ApiV01VrpResultSolutionRoute>',
        :'unassigned' => :'Array<ApiV01VrpResultSolutionUnassigned>',
        :'elapsed' => :'Integer'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'heuristic_synthesis')
        self.heuristic_synthesis = attributes[:'heuristic_synthesis']
      end

      if attributes.has_key?(:'solvers')
        if (value = attributes[:'solvers']).is_a?(Array)
          self.solvers = value
        end
      end

      if attributes.has_key?(:'cost')
        self.cost = attributes[:'cost']
      end

      if attributes.has_key?(:'cost_details')
        self.cost_details = attributes[:'cost_details']
      end

      if attributes.has_key?(:'iterations')
        self.iterations = attributes[:'iterations']
      end

      if attributes.has_key?(:'total_distance')
        self.total_distance = attributes[:'total_distance']
      end

      if attributes.has_key?(:'total_time')
        self.total_time = attributes[:'total_time']
      end

      if attributes.has_key?(:'total_travel_time')
        self.total_travel_time = attributes[:'total_travel_time']
      end

      if attributes.has_key?(:'total_waiting_time')
        self.total_waiting_time = attributes[:'total_waiting_time']
      end

      if attributes.has_key?(:'routes')
        if (value = attributes[:'routes']).is_a?(Array)
          self.routes = value
        end
      end

      if attributes.has_key?(:'unassigned')
        if (value = attributes[:'unassigned']).is_a?(Array)
          self.unassigned = value
        end
      end

      if attributes.has_key?(:'elapsed')
        self.elapsed = attributes[:'elapsed']
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
          heuristic_synthesis == o.heuristic_synthesis &&
          solvers == o.solvers &&
          cost == o.cost &&
          cost_details == o.cost_details &&
          iterations == o.iterations &&
          total_distance == o.total_distance &&
          total_time == o.total_time &&
          total_travel_time == o.total_travel_time &&
          total_waiting_time == o.total_waiting_time &&
          routes == o.routes &&
          unassigned == o.unassigned &&
          elapsed == o.elapsed
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [heuristic_synthesis, solvers, cost, cost_details, iterations, total_distance, total_time, total_travel_time, total_waiting_time, routes, unassigned, elapsed].hash
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