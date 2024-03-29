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
  class Post01VrpSubmitVrpVehicles
    # `car`, `truck`, `bicycle`, etc... See the Router Wrapper API doc.
    attr_accessor :router_mode

    # Related matrix, if already defined
    attr_accessor :matrix_id

    # time or dimension, choose between a matrix based on minimal route duration or on minimal route distance
    attr_accessor :router_dimension

    # Multiplies the vehicle speed, default : 1.0. Specifies if this vehicle is faster or slower than average speed.
    attr_accessor :speed_multiplier

    # List of latitudes and longitudes separated with commas. Areas separated with pipes (available only for truck mode at this time).
    attr_accessor :area

    # Speed multiplier per area, 0 to avoid area. Areas separated with pipes (available only for truck mode at this time).
    attr_accessor :speed_multiplier_area

    # Take into account traffic or not
    attr_accessor :traffic

    # Departure date time (only used if router supports traffic)
    attr_accessor :departure

    # Use track or not
    attr_accessor :track

    # Use motorway or not
    attr_accessor :motorway

    # Use toll section or not
    attr_accessor :toll

    # Number of trailers
    attr_accessor :trailers

    # Vehicle weight including trailers and shipped goods, in tons
    attr_accessor :weight

    # Weight per axle, in tons
    attr_accessor :weight_per_axle

    # Height in meters
    attr_accessor :height

    # Width in meters
    attr_accessor :width

    # Length in meters
    attr_accessor :length

    # List of hazardous materials in the vehicle
    attr_accessor :hazardous_goods

    # Max distance by walk
    attr_accessor :max_walk_distance

    # Arrive/Leave in the traffic direction
    attr_accessor :approach

    # Snap waypoint to junction close by snap distance
    attr_accessor :snap

    # Strict compliance with truck limitations
    attr_accessor :strict_restriction

    # Cost applied if the vehicle is used
    attr_accessor :cost_fixed

    # Cost applied to the distance performed
    attr_accessor :cost_distance_multiplier

    # Cost applied to the total time of route (ORtools). Not taken into account within periodic heuristic.
    attr_accessor :cost_time_multiplier

    # Multiplier applied to the value matrix and additional activity value. Not taken into account within periodic heuristic.
    attr_accessor :cost_value_multiplier

    # Cost applied to the waiting time in the route. Not taken into account within periodic heuristic.
    attr_accessor :cost_waiting_time_multiplier

    # Cost applied if a point is delivered late (ORtools only). Not taken into account within periodic heuristic.
    attr_accessor :cost_late_multiplier

    # Begin of the tour
    attr_accessor :start_point_id

    # End of the tour
    attr_accessor :end_point_id

    # Define the limit of entities the vehicle could carry. The maximum precision supported is 1e-3.
    attr_accessor :capacities

    # (Scheduling only) Define the vehicle work schedule over a period
    attr_accessor :sequence_timewindows

    # Sequence timewindows to consider
    attr_accessor :timewindow_id

    attr_accessor :timewindow

    # Rests within the route. Not available with periodic heuristic.
    attr_accessor :rest_ids

    attr_accessor :id

    # Coefficient applied to every setup duration defined in the tour, for this vehicle. Not taken into account within periodic heuristic.
    attr_accessor :coef_setup

    # Constant additional setup duration for all setup defined in the tour, for this vehicle. Not taken into account within periodic heuristic.
    attr_accessor :additional_setup

    # Coefficient applied to every service duration defined in the tour, for this vehicle. Not taken into account within periodic heuristic.
    attr_accessor :coef_service

    # Constant additional service time for all travel defined in the tour, for this vehicle. Not taken into account within periodic heuristic.
    attr_accessor :additional_service

    # Force the vehicle to start as soon as the vehicle timewindow is open,       as late as possible or let vehicle start at any time. Not available with periodic heuristic, it will always leave as soon as possible.
    attr_accessor :shift_preference

    # The number of times a vehicle is allowed to return to the depot within its route. Not available with periodic heuristic.
    attr_accessor :trips

    # If any value matrix defined, related matrix index
    attr_accessor :value_matrix_id

    # Maximum tour duration
    attr_accessor :duration

    # Maximum tour distance. Not available with periodic heuristic.
    attr_accessor :distance

    # Maximum ride duration between two route activities
    attr_accessor :maximum_ride_time

    # Maximum ride distance between two route activities
    attr_accessor :maximum_ride_distance

    # Particular abilities which could be handle by the vehicle. This parameter is a set of alternative skills, and must be defined as an Array[Array[String]]. Not available with periodic heuristic.
    attr_accessor :skills

    # (Scheduling only) Express the exceptionnals indices of unavailabilty
    attr_accessor :unavailable_work_day_indices

    # (Scheduling only) Express the exceptionnals days of unavailability
    attr_accessor :unavailable_work_date

    # (Scheduling only) Day index ranges where vehicle is not available
    attr_accessor :unavailable_index_ranges

    # (Scheduling only) Date ranges where vehicle is not available
    attr_accessor :unavailable_date_ranges

    # Do not take into account the route leaving the depot in the objective. Not available with periodic heuristic.
    attr_accessor :free_approach

    # Do not take into account the route arriving at the depot in the objective. Not available with periodic heuristic.
    attr_accessor :free_return

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
        :'router_mode' => :'router_mode',
        :'matrix_id' => :'matrix_id',
        :'router_dimension' => :'router_dimension',
        :'speed_multiplier' => :'speed_multiplier',
        :'area' => :'area',
        :'speed_multiplier_area' => :'speed_multiplier_area',
        :'traffic' => :'traffic',
        :'departure' => :'departure',
        :'track' => :'track',
        :'motorway' => :'motorway',
        :'toll' => :'toll',
        :'trailers' => :'trailers',
        :'weight' => :'weight',
        :'weight_per_axle' => :'weight_per_axle',
        :'height' => :'height',
        :'width' => :'width',
        :'length' => :'length',
        :'hazardous_goods' => :'hazardous_goods',
        :'max_walk_distance' => :'max_walk_distance',
        :'approach' => :'approach',
        :'snap' => :'snap',
        :'strict_restriction' => :'strict_restriction',
        :'cost_fixed' => :'cost_fixed',
        :'cost_distance_multiplier' => :'cost_distance_multiplier',
        :'cost_time_multiplier' => :'cost_time_multiplier',
        :'cost_value_multiplier' => :'cost_value_multiplier',
        :'cost_waiting_time_multiplier' => :'cost_waiting_time_multiplier',
        :'cost_late_multiplier' => :'cost_late_multiplier',
        :'start_point_id' => :'start_point_id',
        :'end_point_id' => :'end_point_id',
        :'capacities' => :'capacities',
        :'sequence_timewindows' => :'sequence_timewindows',
        :'timewindow_id' => :'timewindow_id',
        :'timewindow' => :'timewindow',
        :'rest_ids' => :'rest_ids',
        :'id' => :'id',
        :'coef_setup' => :'coef_setup',
        :'additional_setup' => :'additional_setup',
        :'coef_service' => :'coef_service',
        :'additional_service' => :'additional_service',
        :'shift_preference' => :'shift_preference',
        :'trips' => :'trips',
        :'value_matrix_id' => :'value_matrix_id',
        :'duration' => :'duration',
        :'distance' => :'distance',
        :'maximum_ride_time' => :'maximum_ride_time',
        :'maximum_ride_distance' => :'maximum_ride_distance',
        :'skills' => :'skills',
        :'unavailable_work_day_indices' => :'unavailable_work_day_indices',
        :'unavailable_work_date' => :'unavailable_work_date',
        :'unavailable_index_ranges' => :'unavailable_index_ranges',
        :'unavailable_date_ranges' => :'unavailable_date_ranges',
        :'free_approach' => :'free_approach',
        :'free_return' => :'free_return'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'router_mode' => :'String',
        :'matrix_id' => :'String',
        :'router_dimension' => :'String',
        :'speed_multiplier' => :'Float',
        :'area' => :'Array<String>',
        :'speed_multiplier_area' => :'Array<Float>',
        :'traffic' => :'BOOLEAN',
        :'departure' => :'DateTime',
        :'track' => :'BOOLEAN',
        :'motorway' => :'BOOLEAN',
        :'toll' => :'BOOLEAN',
        :'trailers' => :'Integer',
        :'weight' => :'Float',
        :'weight_per_axle' => :'Float',
        :'height' => :'Float',
        :'width' => :'Float',
        :'length' => :'Float',
        :'hazardous_goods' => :'String',
        :'max_walk_distance' => :'Float',
        :'approach' => :'String',
        :'snap' => :'Float',
        :'strict_restriction' => :'BOOLEAN',
        :'cost_fixed' => :'Float',
        :'cost_distance_multiplier' => :'Float',
        :'cost_time_multiplier' => :'Float',
        :'cost_value_multiplier' => :'Float',
        :'cost_waiting_time_multiplier' => :'Float',
        :'cost_late_multiplier' => :'Float',
        :'start_point_id' => :'String',
        :'end_point_id' => :'String',
        :'capacities' => :'Array<Post01VrpSubmitVrpCapacities>',
        :'sequence_timewindows' => :'Array<Post01VrpSubmitVrpTimewindows>',
        :'timewindow_id' => :'String',
        :'timewindow' => :'Post01VrpSubmitVrpTimewindow',
        :'rest_ids' => :'Array<String>',
        :'id' => :'String',
        :'coef_setup' => :'Float',
        :'additional_setup' => :'Float',
        :'coef_service' => :'Float',
        :'additional_service' => :'Float',
        :'shift_preference' => :'String',
        :'trips' => :'Integer',
        :'value_matrix_id' => :'String',
        :'duration' => :'Integer',
        :'distance' => :'Integer',
        :'maximum_ride_time' => :'Integer',
        :'maximum_ride_distance' => :'Integer',
        :'skills' => :'Array<String>',
        :'unavailable_work_day_indices' => :'Array<Integer>',
        :'unavailable_work_date' => :'Array<String>',
        :'unavailable_index_ranges' => :'Array<Post01VrpSubmitVrpUnavailableIndexRanges>',
        :'unavailable_date_ranges' => :'Array<Post01VrpSubmitVrpUnavailableDateRanges>',
        :'free_approach' => :'BOOLEAN',
        :'free_return' => :'BOOLEAN'
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

      if attributes.has_key?(:'matrix_id')
        self.matrix_id = attributes[:'matrix_id']
      end

      if attributes.has_key?(:'router_dimension')
        self.router_dimension = attributes[:'router_dimension']
      end

      if attributes.has_key?(:'speed_multiplier')
        self.speed_multiplier = attributes[:'speed_multiplier']
      else
        self.speed_multiplier = 1.0
      end

      if attributes.has_key?(:'area')
        if (value = attributes[:'area']).is_a?(Array)
          self.area = value
        end
      end

      if attributes.has_key?(:'speed_multiplier_area')
        if (value = attributes[:'speed_multiplier_area']).is_a?(Array)
          self.speed_multiplier_area = value
        end
      end

      if attributes.has_key?(:'traffic')
        self.traffic = attributes[:'traffic']
      end

      if attributes.has_key?(:'departure')
        self.departure = attributes[:'departure']
      end

      if attributes.has_key?(:'track')
        self.track = attributes[:'track']
      else
        self.track = true
      end

      if attributes.has_key?(:'motorway')
        self.motorway = attributes[:'motorway']
      else
        self.motorway = true
      end

      if attributes.has_key?(:'toll')
        self.toll = attributes[:'toll']
      else
        self.toll = true
      end

      if attributes.has_key?(:'trailers')
        self.trailers = attributes[:'trailers']
      end

      if attributes.has_key?(:'weight')
        self.weight = attributes[:'weight']
      end

      if attributes.has_key?(:'weight_per_axle')
        self.weight_per_axle = attributes[:'weight_per_axle']
      end

      if attributes.has_key?(:'height')
        self.height = attributes[:'height']
      end

      if attributes.has_key?(:'width')
        self.width = attributes[:'width']
      end

      if attributes.has_key?(:'length')
        self.length = attributes[:'length']
      end

      if attributes.has_key?(:'hazardous_goods')
        self.hazardous_goods = attributes[:'hazardous_goods']
      end

      if attributes.has_key?(:'max_walk_distance')
        self.max_walk_distance = attributes[:'max_walk_distance']
      else
        self.max_walk_distance = 750.0
      end

      if attributes.has_key?(:'approach')
        self.approach = attributes[:'approach']
      else
        self.approach = 'unrestricted'
      end

      if attributes.has_key?(:'snap')
        self.snap = attributes[:'snap']
      end

      if attributes.has_key?(:'strict_restriction')
        self.strict_restriction = attributes[:'strict_restriction']
      end

      if attributes.has_key?(:'cost_fixed')
        self.cost_fixed = attributes[:'cost_fixed']
      end

      if attributes.has_key?(:'cost_distance_multiplier')
        self.cost_distance_multiplier = attributes[:'cost_distance_multiplier']
      end

      if attributes.has_key?(:'cost_time_multiplier')
        self.cost_time_multiplier = attributes[:'cost_time_multiplier']
      end

      if attributes.has_key?(:'cost_value_multiplier')
        self.cost_value_multiplier = attributes[:'cost_value_multiplier']
      end

      if attributes.has_key?(:'cost_waiting_time_multiplier')
        self.cost_waiting_time_multiplier = attributes[:'cost_waiting_time_multiplier']
      end

      if attributes.has_key?(:'cost_late_multiplier')
        self.cost_late_multiplier = attributes[:'cost_late_multiplier']
      end

      if attributes.has_key?(:'start_point_id')
        self.start_point_id = attributes[:'start_point_id']
      end

      if attributes.has_key?(:'end_point_id')
        self.end_point_id = attributes[:'end_point_id']
      end

      if attributes.has_key?(:'capacities')
        if (value = attributes[:'capacities']).is_a?(Array)
          self.capacities = value
        end
      end

      if attributes.has_key?(:'sequence_timewindows')
        if (value = attributes[:'sequence_timewindows']).is_a?(Array)
          self.sequence_timewindows = value
        end
      end

      if attributes.has_key?(:'timewindow_id')
        self.timewindow_id = attributes[:'timewindow_id']
      end

      if attributes.has_key?(:'timewindow')
        self.timewindow = attributes[:'timewindow']
      end

      if attributes.has_key?(:'rest_ids')
        if (value = attributes[:'rest_ids']).is_a?(Array)
          self.rest_ids = value
        end
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'coef_setup')
        self.coef_setup = attributes[:'coef_setup']
      end

      if attributes.has_key?(:'additional_setup')
        self.additional_setup = attributes[:'additional_setup']
      end

      if attributes.has_key?(:'coef_service')
        self.coef_service = attributes[:'coef_service']
      end

      if attributes.has_key?(:'additional_service')
        self.additional_service = attributes[:'additional_service']
      end

      if attributes.has_key?(:'shift_preference')
        self.shift_preference = attributes[:'shift_preference']
      end

      if attributes.has_key?(:'trips')
        self.trips = attributes[:'trips']
      else
        self.trips = 1
      end

      if attributes.has_key?(:'value_matrix_id')
        self.value_matrix_id = attributes[:'value_matrix_id']
      end

      if attributes.has_key?(:'duration')
        self.duration = attributes[:'duration']
      end

      if attributes.has_key?(:'distance')
        self.distance = attributes[:'distance']
      end

      if attributes.has_key?(:'maximum_ride_time')
        self.maximum_ride_time = attributes[:'maximum_ride_time']
      end

      if attributes.has_key?(:'maximum_ride_distance')
        self.maximum_ride_distance = attributes[:'maximum_ride_distance']
      end

      if attributes.has_key?(:'skills')
        if (value = attributes[:'skills']).is_a?(Array)
          self.skills = value
        end
      end

      if attributes.has_key?(:'unavailable_work_day_indices')
        if (value = attributes[:'unavailable_work_day_indices']).is_a?(Array)
          self.unavailable_work_day_indices = value
        end
      end

      if attributes.has_key?(:'unavailable_work_date')
        if (value = attributes[:'unavailable_work_date']).is_a?(Array)
          self.unavailable_work_date = value
        end
      end

      if attributes.has_key?(:'unavailable_index_ranges')
        if (value = attributes[:'unavailable_index_ranges']).is_a?(Array)
          self.unavailable_index_ranges = value
        end
      end

      if attributes.has_key?(:'unavailable_date_ranges')
        if (value = attributes[:'unavailable_date_ranges']).is_a?(Array)
          self.unavailable_date_ranges = value
        end
      end

      if attributes.has_key?(:'free_approach')
        self.free_approach = attributes[:'free_approach']
      end

      if attributes.has_key?(:'free_return')
        self.free_return = attributes[:'free_return']
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
      router_dimension_validator = EnumAttributeValidator.new('String', ['time', 'distance'])
      return false unless router_dimension_validator.valid?(@router_dimension)
      hazardous_goods_validator = EnumAttributeValidator.new('String', ['explosive', 'gas', 'flammable', 'combustible', 'organic', 'poison', 'radio_active', 'corrosive', 'poisonous_inhalation', 'harmful_to_water', 'other'])
      return false unless hazardous_goods_validator.valid?(@hazardous_goods)
      approach_validator = EnumAttributeValidator.new('String', ['unrestricted', 'curb'])
      return false unless approach_validator.valid?(@approach)
      return false if @id.nil?
      shift_preference_validator = EnumAttributeValidator.new('String', ['force_start', 'force_end', 'minimize_span'])
      return false unless shift_preference_validator.valid?(@shift_preference)
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] hazardous_goods Object to be assigned
    def hazardous_goods=(hazardous_goods)
      validator = EnumAttributeValidator.new('String', ['explosive', 'gas', 'flammable', 'combustible', 'organic', 'poison', 'radio_active', 'corrosive', 'poisonous_inhalation', 'harmful_to_water', 'other'])
      unless validator.valid?(hazardous_goods)
        fail ArgumentError, 'invalid value for "hazardous_goods", must be one of #{validator.allowable_values}.'
      end
      @hazardous_goods = hazardous_goods
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] approach Object to be assigned
    def approach=(approach)
      validator = EnumAttributeValidator.new('String', ['unrestricted', 'curb'])
      unless validator.valid?(approach)
        fail ArgumentError, 'invalid value for "approach", must be one of #{validator.allowable_values}.'
      end
      @approach = approach
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] shift_preference Object to be assigned
    def shift_preference=(shift_preference)
      validator = EnumAttributeValidator.new('String', ['force_start', 'force_end', 'minimize_span'])
      unless validator.valid?(shift_preference)
        fail ArgumentError, 'invalid value for "shift_preference", must be one of #{validator.allowable_values}.'
      end
      @shift_preference = shift_preference
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          router_mode == o.router_mode &&
          matrix_id == o.matrix_id &&
          router_dimension == o.router_dimension &&
          speed_multiplier == o.speed_multiplier &&
          area == o.area &&
          speed_multiplier_area == o.speed_multiplier_area &&
          traffic == o.traffic &&
          departure == o.departure &&
          track == o.track &&
          motorway == o.motorway &&
          toll == o.toll &&
          trailers == o.trailers &&
          weight == o.weight &&
          weight_per_axle == o.weight_per_axle &&
          height == o.height &&
          width == o.width &&
          length == o.length &&
          hazardous_goods == o.hazardous_goods &&
          max_walk_distance == o.max_walk_distance &&
          approach == o.approach &&
          snap == o.snap &&
          strict_restriction == o.strict_restriction &&
          cost_fixed == o.cost_fixed &&
          cost_distance_multiplier == o.cost_distance_multiplier &&
          cost_time_multiplier == o.cost_time_multiplier &&
          cost_value_multiplier == o.cost_value_multiplier &&
          cost_waiting_time_multiplier == o.cost_waiting_time_multiplier &&
          cost_late_multiplier == o.cost_late_multiplier &&
          start_point_id == o.start_point_id &&
          end_point_id == o.end_point_id &&
          capacities == o.capacities &&
          sequence_timewindows == o.sequence_timewindows &&
          timewindow_id == o.timewindow_id &&
          timewindow == o.timewindow &&
          rest_ids == o.rest_ids &&
          id == o.id &&
          coef_setup == o.coef_setup &&
          additional_setup == o.additional_setup &&
          coef_service == o.coef_service &&
          additional_service == o.additional_service &&
          shift_preference == o.shift_preference &&
          trips == o.trips &&
          value_matrix_id == o.value_matrix_id &&
          duration == o.duration &&
          distance == o.distance &&
          maximum_ride_time == o.maximum_ride_time &&
          maximum_ride_distance == o.maximum_ride_distance &&
          skills == o.skills &&
          unavailable_work_day_indices == o.unavailable_work_day_indices &&
          unavailable_work_date == o.unavailable_work_date &&
          unavailable_index_ranges == o.unavailable_index_ranges &&
          unavailable_date_ranges == o.unavailable_date_ranges &&
          free_approach == o.free_approach &&
          free_return == o.free_return
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [router_mode, matrix_id, router_dimension, speed_multiplier, area, speed_multiplier_area, traffic, departure, track, motorway, toll, trailers, weight, weight_per_axle, height, width, length, hazardous_goods, max_walk_distance, approach, snap, strict_restriction, cost_fixed, cost_distance_multiplier, cost_time_multiplier, cost_value_multiplier, cost_waiting_time_multiplier, cost_late_multiplier, start_point_id, end_point_id, capacities, sequence_timewindows, timewindow_id, timewindow, rest_ids, id, coef_setup, additional_setup, coef_service, additional_service, shift_preference, trips, value_matrix_id, duration, distance, maximum_ride_time, maximum_ride_distance, skills, unavailable_work_day_indices, unavailable_work_date, unavailable_index_ranges, unavailable_date_ranges, free_approach, free_return].hash
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
