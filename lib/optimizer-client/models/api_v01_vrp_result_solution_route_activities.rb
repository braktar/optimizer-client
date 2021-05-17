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
  class ApiV01VrpResultSolutionRouteActivities
    # 
    attr_accessor :day_week_num

    # 
    attr_accessor :day_week

    # Linked spatial point
    attr_accessor :point_id

    # Travel distance from previous point (in m)
    attr_accessor :travel_distance

    # Travel time from previous point (in s)
    attr_accessor :travel_time

    # Travel value from previous point
    attr_accessor :travel_value

    # Idle time (in s)
    attr_accessor :waiting_time

    # Time visit starts
    attr_accessor :begin_time

    # Time visit ends
    attr_accessor :end_time

    # 
    attr_accessor :departure_time

    # Internal reference of the service
    attr_accessor :service_id

    # Internal reference of the shipment
    attr_accessor :pickup_shipment_id

    # Internal reference of the shipment
    attr_accessor :delivery_shipment_id

    # Internal reference of the rest
    attr_accessor :rest_id

    # 
    attr_accessor :detail

    # depot, rest, service, pickup or delivery
    attr_accessor :type

    # Travel distance from route start to current point (in m)
    attr_accessor :current_distance

    # When one service has alternative activities, index of the chosen one
    attr_accessor :alternative

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'day_week_num' => :'day_week_num',
        :'day_week' => :'day_week',
        :'point_id' => :'point_id',
        :'travel_distance' => :'travel_distance',
        :'travel_time' => :'travel_time',
        :'travel_value' => :'travel_value',
        :'waiting_time' => :'waiting_time',
        :'begin_time' => :'begin_time',
        :'end_time' => :'end_time',
        :'departure_time' => :'departure_time',
        :'service_id' => :'service_id',
        :'pickup_shipment_id' => :'pickup_shipment_id',
        :'delivery_shipment_id' => :'delivery_shipment_id',
        :'rest_id' => :'rest_id',
        :'detail' => :'detail',
        :'type' => :'type',
        :'current_distance' => :'current_distance',
        :'alternative' => :'alternative'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'day_week_num' => :'String',
        :'day_week' => :'String',
        :'point_id' => :'String',
        :'travel_distance' => :'Integer',
        :'travel_time' => :'Integer',
        :'travel_value' => :'Integer',
        :'waiting_time' => :'Integer',
        :'begin_time' => :'Integer',
        :'end_time' => :'Integer',
        :'departure_time' => :'Integer',
        :'service_id' => :'String',
        :'pickup_shipment_id' => :'String',
        :'delivery_shipment_id' => :'String',
        :'rest_id' => :'String',
        :'detail' => :'ApiV01VrpResultSolutionRouteActivityDetails',
        :'type' => :'String',
        :'current_distance' => :'Integer',
        :'alternative' => :'Integer'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'day_week_num')
        self.day_week_num = attributes[:'day_week_num']
      end

      if attributes.has_key?(:'day_week')
        self.day_week = attributes[:'day_week']
      end

      if attributes.has_key?(:'point_id')
        self.point_id = attributes[:'point_id']
      end

      if attributes.has_key?(:'travel_distance')
        self.travel_distance = attributes[:'travel_distance']
      end

      if attributes.has_key?(:'travel_time')
        self.travel_time = attributes[:'travel_time']
      end

      if attributes.has_key?(:'travel_value')
        self.travel_value = attributes[:'travel_value']
      end

      if attributes.has_key?(:'waiting_time')
        self.waiting_time = attributes[:'waiting_time']
      end

      if attributes.has_key?(:'begin_time')
        self.begin_time = attributes[:'begin_time']
      end

      if attributes.has_key?(:'end_time')
        self.end_time = attributes[:'end_time']
      end

      if attributes.has_key?(:'departure_time')
        self.departure_time = attributes[:'departure_time']
      end

      if attributes.has_key?(:'service_id')
        self.service_id = attributes[:'service_id']
      end

      if attributes.has_key?(:'pickup_shipment_id')
        self.pickup_shipment_id = attributes[:'pickup_shipment_id']
      end

      if attributes.has_key?(:'delivery_shipment_id')
        self.delivery_shipment_id = attributes[:'delivery_shipment_id']
      end

      if attributes.has_key?(:'rest_id')
        self.rest_id = attributes[:'rest_id']
      end

      if attributes.has_key?(:'detail')
        self.detail = attributes[:'detail']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'current_distance')
        self.current_distance = attributes[:'current_distance']
      end

      if attributes.has_key?(:'alternative')
        self.alternative = attributes[:'alternative']
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
          day_week_num == o.day_week_num &&
          day_week == o.day_week &&
          point_id == o.point_id &&
          travel_distance == o.travel_distance &&
          travel_time == o.travel_time &&
          travel_value == o.travel_value &&
          waiting_time == o.waiting_time &&
          begin_time == o.begin_time &&
          end_time == o.end_time &&
          departure_time == o.departure_time &&
          service_id == o.service_id &&
          pickup_shipment_id == o.pickup_shipment_id &&
          delivery_shipment_id == o.delivery_shipment_id &&
          rest_id == o.rest_id &&
          detail == o.detail &&
          type == o.type &&
          current_distance == o.current_distance &&
          alternative == o.alternative
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [day_week_num, day_week, point_id, travel_distance, travel_time, travel_value, waiting_time, begin_time, end_time, departure_time, service_id, pickup_shipment_id, delivery_shipment_id, rest_id, detail, type, current_distance, alternative].hash
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
