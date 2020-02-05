=begin
#Optimizers API

#Unified API for multiple optimizer engines dedicated to Vehicle Routing Problems

OpenAPI spec version: 0.1.0
Contact: tech@mapotempo.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.12

=end

require 'date'

module OptimizerClient
  # Parameters independent from the search
  class Post01VrpSubmitVrpConfigurationPreprocessing
    # Divide the problem into clusters beyond this threshold
    attr_accessor :max_split_size

    # [ DEPRECATED : use partitions structure instead ]
    attr_accessor :partition_method

    # [ DEPRECATED : use partitions structure instead ]
    attr_accessor :partition_metric

    # Forces centroid indices used to generate clusters with kmeans partition_method. Only available with deprecated partition_method
    attr_accessor :kmeans_centroids

    # Regroup close points which constitute a cluster into a single geolocated point
    attr_accessor :cluster_threshold

    # Force to cluster visits even if containing timewindows and quantities
    attr_accessor :force_cluster

    # Could allow to pass multiple time in the same street but deliver in a single row
    attr_accessor :prefer_short_segment

    # Limit the size of the considered neighbourhood within the search
    attr_accessor :neighbourhood_size

    # Describes partition process to perform before solving. Partitions will be performed in provided order
    attr_accessor :partitions

    # Forces first solution strategy. Either one value to force specific behavior, or a list in order to test several ones and select the best. If string is 'internal', we will choose among pre-selected behaviors. There can not be more than three behaviors (ORtools only)
    attr_accessor :first_solution_strategy

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'max_split_size' => :'max_split_size',
        :'partition_method' => :'partition_method',
        :'partition_metric' => :'partition_metric',
        :'kmeans_centroids' => :'kmeans_centroids',
        :'cluster_threshold' => :'cluster_threshold',
        :'force_cluster' => :'force_cluster',
        :'prefer_short_segment' => :'prefer_short_segment',
        :'neighbourhood_size' => :'neighbourhood_size',
        :'partitions' => :'partitions',
        :'first_solution_strategy' => :'first_solution_strategy'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'max_split_size' => :'Integer',
        :'partition_method' => :'String',
        :'partition_metric' => :'String',
        :'kmeans_centroids' => :'Array<Integer>',
        :'cluster_threshold' => :'Float',
        :'force_cluster' => :'BOOLEAN',
        :'prefer_short_segment' => :'BOOLEAN',
        :'neighbourhood_size' => :'Integer',
        :'partitions' => :'Array<Post01VrpSubmitVrpConfigurationPreprocessingPartitions>',
        :'first_solution_strategy' => :'Array<String>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'max_split_size')
        self.max_split_size = attributes[:'max_split_size']
      end

      if attributes.has_key?(:'partition_method')
        self.partition_method = attributes[:'partition_method']
      end

      if attributes.has_key?(:'partition_metric')
        self.partition_metric = attributes[:'partition_metric']
      end

      if attributes.has_key?(:'kmeans_centroids')
        if (value = attributes[:'kmeans_centroids']).is_a?(Array)
          self.kmeans_centroids = value
        end
      end

      if attributes.has_key?(:'cluster_threshold')
        self.cluster_threshold = attributes[:'cluster_threshold']
      end

      if attributes.has_key?(:'force_cluster')
        self.force_cluster = attributes[:'force_cluster']
      end

      if attributes.has_key?(:'prefer_short_segment')
        self.prefer_short_segment = attributes[:'prefer_short_segment']
      end

      if attributes.has_key?(:'neighbourhood_size')
        self.neighbourhood_size = attributes[:'neighbourhood_size']
      end

      if attributes.has_key?(:'partitions')
        if (value = attributes[:'partitions']).is_a?(Array)
          self.partitions = value
        end
      end

      if attributes.has_key?(:'first_solution_strategy')
        if (value = attributes[:'first_solution_strategy']).is_a?(Array)
          self.first_solution_strategy = value
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
          max_split_size == o.max_split_size &&
          partition_method == o.partition_method &&
          partition_metric == o.partition_metric &&
          kmeans_centroids == o.kmeans_centroids &&
          cluster_threshold == o.cluster_threshold &&
          force_cluster == o.force_cluster &&
          prefer_short_segment == o.prefer_short_segment &&
          neighbourhood_size == o.neighbourhood_size &&
          partitions == o.partitions &&
          first_solution_strategy == o.first_solution_strategy
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [max_split_size, partition_method, partition_metric, kmeans_centroids, cluster_threshold, force_cluster, prefer_short_segment, neighbourhood_size, partitions, first_solution_strategy].hash
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
