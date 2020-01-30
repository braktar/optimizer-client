=begin
#Optimizers API

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 0.1.0
Contact: tech@mapotempo.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.12

=end

require 'date'

module OptimizerClient
  class Post01VrpSubmitVrpShipments
    attr_accessor :id

    # Priority assigned to the service in case of conflict to assign every jobs (from 0 to 8, default is 4)
    attr_accessor :priority

    # Exclusion cost
    attr_accessor :exclusion_cost

    # Total number of visits over the complete schedule (including the unavailable visit indices)
    attr_accessor :visits_number

    # [planning] unavailable indices of visit
    attr_accessor :unavailable_visit_indices

    # [planning] Express the exceptionnals days indices of unavailabilty
    attr_accessor :unavailable_visit_day_indices

    # Minimum day lapse between two visits
    attr_accessor :minimum_lapse

    # Maximum day lapse between two visits
    attr_accessor :maximum_lapse

    # Maximum in route duration of this particular shipment (Must be feasible !)
    attr_accessor :maximum_inroute_duration

    # Defined to which vehicle the shipment is assigned
    attr_accessor :sticky_vehicle_ids

    # Particular abilities required by a vehicle to perform this shipment
    attr_accessor :skills

    attr_accessor :pickup

    attr_accessor :delivery

    attr_accessor :quantities

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'priority' => :'priority',
        :'exclusion_cost' => :'exclusion_cost',
        :'visits_number' => :'visits_number',
        :'unavailable_visit_indices' => :'unavailable_visit_indices',
        :'unavailable_visit_day_indices' => :'unavailable_visit_day_indices',
        :'minimum_lapse' => :'minimum_lapse',
        :'maximum_lapse' => :'maximum_lapse',
        :'maximum_inroute_duration' => :'maximum_inroute_duration',
        :'sticky_vehicle_ids' => :'sticky_vehicle_ids',
        :'skills' => :'skills',
        :'pickup' => :'pickup',
        :'delivery' => :'delivery',
        :'quantities' => :'quantities'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'String',
        :'priority' => :'Integer',
        :'exclusion_cost' => :'Integer',
        :'visits_number' => :'Integer',
        :'unavailable_visit_indices' => :'Integer',
        :'unavailable_visit_day_indices' => :'Integer',
        :'minimum_lapse' => :'Float',
        :'maximum_lapse' => :'Float',
        :'maximum_inroute_duration' => :'Integer',
        :'sticky_vehicle_ids' => :'String',
        :'skills' => :'String',
        :'pickup' => :'Array<Post01VrpSubmitVrpActivity>',
        :'delivery' => :'Array<Post01VrpSubmitVrpActivity>',
        :'quantities' => :'Array<Post01VrpSubmitVrpQuantities>'
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

      if attributes.has_key?(:'priority')
        self.priority = attributes[:'priority']
      end

      if attributes.has_key?(:'exclusion_cost')
        self.exclusion_cost = attributes[:'exclusion_cost']
      end

      if attributes.has_key?(:'visits_number')
        self.visits_number = attributes[:'visits_number']
      end

      if attributes.has_key?(:'unavailable_visit_indices')
        self.unavailable_visit_indices = attributes[:'unavailable_visit_indices']
      end

      if attributes.has_key?(:'unavailable_visit_day_indices')
        self.unavailable_visit_day_indices = attributes[:'unavailable_visit_day_indices']
      end

      if attributes.has_key?(:'minimum_lapse')
        self.minimum_lapse = attributes[:'minimum_lapse']
      end

      if attributes.has_key?(:'maximum_lapse')
        self.maximum_lapse = attributes[:'maximum_lapse']
      end

      if attributes.has_key?(:'maximum_inroute_duration')
        self.maximum_inroute_duration = attributes[:'maximum_inroute_duration']
      end

      if attributes.has_key?(:'sticky_vehicle_ids')
        self.sticky_vehicle_ids = attributes[:'sticky_vehicle_ids']
      end

      if attributes.has_key?(:'skills')
        self.skills = attributes[:'skills']
      end

      if attributes.has_key?(:'pickup')
        if (value = attributes[:'pickup']).is_a?(Array)
          self.pickup = value
        end
      end

      if attributes.has_key?(:'delivery')
        if (value = attributes[:'delivery']).is_a?(Array)
          self.delivery = value
        end
      end

      if attributes.has_key?(:'quantities')
        if (value = attributes[:'quantities']).is_a?(Array)
          self.quantities = value
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
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          priority == o.priority &&
          exclusion_cost == o.exclusion_cost &&
          visits_number == o.visits_number &&
          unavailable_visit_indices == o.unavailable_visit_indices &&
          unavailable_visit_day_indices == o.unavailable_visit_day_indices &&
          minimum_lapse == o.minimum_lapse &&
          maximum_lapse == o.maximum_lapse &&
          maximum_inroute_duration == o.maximum_inroute_duration &&
          sticky_vehicle_ids == o.sticky_vehicle_ids &&
          skills == o.skills &&
          pickup == o.pickup &&
          delivery == o.delivery &&
          quantities == o.quantities
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, priority, exclusion_cost, visits_number, unavailable_visit_indices, unavailable_visit_day_indices, minimum_lapse, maximum_lapse, maximum_inroute_duration, sticky_vehicle_ids, skills, pickup, delivery, quantities].hash
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
