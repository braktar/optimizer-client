=begin
#Optimizers API

# ## Table of Contents * [Overview](#overview) * [Standard Optimisation](#standard-optimisation)   * [Input Model](#input-model)     * [General Model](#general-model)     * [Points](#points)     * [TimeWindows](#timewindows)     * [Vehicles](#vehicles)     * [Activities](#activities)     * [Services and Shipments](#services-and-shipments)     * [Matrices](#matrices)     * [Units](#units)     * [Capacities](#capacities)     * [Quantities](#quantities)     * [Rests](#rests)     * [Relations](#relations)     * [Configuration](#configuration)   * [Solve](#solve)     * [Lateness¹](#lateness)     * [Multiple Vehicles](#multiple-vehicles)     * [Multiple Depots](#multiple-depots)     * [Multiple Timewindows¹](#multiple-timewindows)     * [Multiple Matrices¹](#multiple-matrices)     * [Pickup or Delivery](#pickup-or-delivery)     * [Priority¹](#priority)     * [Quantities Overload¹](#quantities-overload)     * [Setup Duration](#setup-duration)     * [Skills](#skills)     * [Alternative Skills³](#alternative-skills) * [Schedule Optimisation](#schedule-optimisation)   * [Problem Definition](#problem-definition)   * [Vehicle Definition](#vehicle-definition)   * [Services Definition](#services-definition)   * [Additional Parameters](#additional-parameters)     * [Minimum/Maximum Lapse](#min-max-lapse) * [Zones](#zones)  ----------------- * ¹ Currently not available with Jsprit * ² Currently not available with ORtools  -----------------  <a name=\"overview\"></a>Overview ==  The API has been built to wrap a large panel of  Traveling Salesman Problem(TSP) and Vehicle Routing Problem(VRP) constraints in order to call the most fitted solvers.  The currently integreted solvers are: *   **[Vroom](https://github.com/VROOM-Project/vroom)** only handle the basic Traveling Salesman Problem. *   **[ORtools](https://github.com/google/or-tools)** handle multiple vehicles, timewindows, quantities, skills and lateness. *   **[Jsprit](https://github.com/graphhopper/jsprit)** handle multiple vehicles, timewindows, quantities, skills and setup duration.  In order to select which solver will be used, we have created several assert. If the conditions are satisfied, the solver called can be used.  *   **assert_at_least_one_mission** :  *ORtools, Vroom*. The VRP has at least one service or one shipment. *   **assert_end_optimization** :  *ORtools*. The VRP has a resolution_duration or a resolution_iterations_without_improvment. *   **assert_matrices_only_one** :  *Vroom*. The VRP has only one matrix or only one vehicle configuration type (router_mode, router_dimension, speed_multiplier). *   **assert_no_relations** :  *Vroom*. The VRP has no relations or every relation has no linked_ids and no linked_vehicle_ids. *   **assert_no_routes** :  *Vroom*. The Routes have no mission_ids. *   **assert_no_shipments** :  *Vroom*. The VRP has no shipments. *   **assert_no_shipments_with_multiple_timewindows** :  The Shipments pickup and delivery have at most one timewindow. *   **assert_no_value_matrix** :  *Vroom*. The matrices have no value. *   **assert_no_zones** :  The VRP contains no zone. *   **assert_one_sticky_at_most** :  The Services and Shipments have at most one sticky_vehicle. *   **assert_one_vehicle_only_or_no_sticky_vehicle** :  *Vroom*. The VRP has no more than one vehicle || The Services and Shipments have no sticky_vehicle. *   **assert_only_empty_or_fill_quantities** :  *ORtools*. The VRP have no services which empty and fill the same quantity. *   **assert_points_same_definition** :  *ORtools, Vroom*. All the Points have the same definition, location || matrix_index || matrix_index. *   **assert_services_at_most_two_timewindows** :  The Services have at most two timewindows *   **assert_services_no_capacities** :  *Vroom*. The Vehicles have no capacity. *   **assert_services_no_late_multiplier** :  The Services have no late multiplier cost. *   **assert_services_no_multiple_timewindows** :  The Services have at most one timewindow. *   **assert_services_no_priority** :  *Vroom*. The Services have a priority equal to 4 (which means no priority). *   **assert_services_no_skills** :  *Vroom*. The Services have no skills. *   **assert_services_no_timewindows** :  *Vroom*. The Services have no timewindow. *   **assert_services_quantities_only_one** :  The Services have no size quantity strictly superior to 1. *   **assert_shipments_no_late_multiplier** :  The Shipments have no pickup and delivery late multiplier cost. *   **assert_units_only_one** :  The VRP has at most one unit. *   **assert_vehicles_at_least_one** :  *ORtools*. The VRP has at least one vehicle. *   **assert_vehicles_capacities_only_one** :  The Vehicles have at most one capacity. *   **assert_vehicles_no_alternative_skills** :  *ORtools*. The Vehicles have no altenartive skills. *   **assert_vehicles_no_capacity_initial** :  *ORtools*. The Vehicles have no inital capcity different than 0. *   **assert_vehicles_no_duration_limit** :  *Vroom*. The Vehicles have no duration. *   **assert_vehicles_no_end_time_or_late_multiplier** :  *Vroom*. The Vehicles have no timewindow or have a cost_late_multiplier strictly superior to 0. *   **assert_vehicles_no_force_start** :  The Vehicles have no start forced. *   **assert_vehicles_no_late_multiplier** :  The Vehicles have no late multiplier cost. *   **assert_vehicles_no_overload_multiplier** :  The Vehicles have no overload multiplier. *   **assert_vehicles_no_rests** :  The Vehicles have no rest. *   **assert_vehicles_no_timewindow** :  The Vehicles have no timewindow. *   **assert_vehicles_no_zero_duration** :  *ORtools*. The Vehicles have no duration equal to 0. *   **assert_vehicles_only_one** :  *Vroom*. The VRP has only one vehicle and the VRP has no schedule range indices and no schedule range date. *   **assert_vehicles_start** :  The Vehicles have no start_point. *   **assert_vehicles_start_or_end** :  *Vroom*. The Vehicles have no start_point and no end_point. *   **assert_zones_only_size_one_alternative** :  *ORtools*. The Zones have at most one alternative allocation.   <a name=\"standard-optimisation\"></a>Standard Optimisation ==  <a name=\"input-model\"></a>Input Model --  Before calling the solvers, a VRP model must be defined, which represent the problem to solve with all its parameters and constraints.  ### <a name=\"general-model\"></a>**General Model** ```json \"vrp\": {   \"points\": [..],   \"vehicles\": [..],   \"units\": [..],   \"services\": [..],   \"shipments\": [..],   \"matrices\": [..],   \"rests\": [..],   \"relations\": [..],   \"configuration\": {..} } ``` Those high level entities are completed by few others as **timewindows** and **activities** which are locally defined. To define the model, the first step will be to every **points** which will be used in the description of the problem. This will include the depots and the customers locations. Furthermore at least one **vehicle** is mandatory and define at least one **service** or **shipment** will be essential to launch the solve. The others entities are optional but will be unavoidable depending on the problem to describe.  ### <a name=\"points\"></a>**Points** Represent a point in space, it could be called as a __location__ with latitude and longitude coordinates. With coordinates ```json   \"points\": [{       \"id\": \"vehicle-start\",       \"location\": {         \"lat\": start_lat,         \"lon\": start_lon       }     }, {       \"id\": \"vehicle-end\",       \"location\": {         \"lat\": start_lat,         \"lon\": start_lon       }     }, {       \"id\": \"visit-point-1\",       \"location\": {         \"lat\": visit_lat,         \"lon\": visit_lon       }, {       \"id\": \"visit-point-2\",       \"location\": {         \"lat\": visit_lat,         \"lon\": visit_lon       }     }] ``` Or as a __matrix_index__ can be used to link to its position within the matrices. This could be usefull if the routing data are provided from an external source. ```json   \"points\": [{       \"id\": \"vehicle-start\",       \"matrix_index\": 0     }, {       \"id\": \"vehicle-end\",       \"matrix_index\": 1     }, {       \"id\": \"visit-point-1\",       \"matrix_index\": 2     }, {       \"id\": \"visit-point-2\",       \"matrix_index\": 3     }] ``` ### <a name=\"timewindows\"></a>**TimeWindows** Define a time interval when a resource is available or when an activity can begin. By default times and durations are supposed to be defined in seconds. If a time matrix is send with the problem, values must be set on the same time unit. Vehicles only have single timewindow ```json   \"timewindow\": {     \"start\": 0,     \"end\": 7200   } ``` Activities can have multiple timewindows ```json   \"timewindows\": [{     \"start\": 600,     \"end\": 900   },{     \"start\": 1200,     \"end\": 1500   }], ``` ### <a name=\"vehicles\"></a>**Vehicles** Describe the features of the existing or supposed vehicles. It should be taken in every sense, it could represent a work day of a particular driver/vehicle, or a planning over long period of time. It represents the entity which must travel between points. ```json   \"vehicles\": [{     \"id\": \"vehicle_id\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"timewindow\": {       \"start\": 0,       \"end\": 7200     },     \"start_point_id\": \"vehicle-start\",     \"end_point_id\": \"vehicle-end\"   }] ``` Costs can also be added in order to fit more precisely the real operating cost ```json   \"vehicles\": [{     \"id\": \"vehicle_id\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"timewindow\": {       \"start\": 0,       \"end\": 7200     },     \"start_point_id\": \"vehicle-start\",     \"end_point_id\": \"vehicle-end\",     \"cost_fixed\": 500.0,     \"cost_distance_multiplier\": 1.0,     \"cost_time_multiplier\": 1.0   }] ``` The router dimension can be set as distance, this describe that the route between will be the shortest, instead of the fastest. ```json   \"vehicles\": [{     \"id\": \"vehicle_id\",     \"router_mode\": \"car\",     \"router_dimension\": \"distance\",     \"speed_multiplier\": 1.0,     \"timewindow\": {       \"start\": 0,       \"end\": 7200     },     \"start_point_id\": \"vehicle-start\",     \"end_point_id\": \"vehicle-end\",     \"cost_fixed\": 500.0,     \"cost_distance_multiplier\": 1.0,     \"cost_time_multiplier\": 0.0   }] ``` Some additional parameters are available : * **force_start** [ DEPRECATED ] Force the vehicle to leave its depot at the starting time of its working timewindow. This option is deprecated. * **shift_preference** Force the vehicle to leave its depot at the starting time of its working timewindow or to get back to depot at the end of its working timewindow or, by default, minimize span. * **duration** Define the maximum duration of the vehicle route * **overall_duration** Define the maximum work duration over whole period for the vehicle, if planning goes for several days * **distance** Define the maximum distance of the vehicle route * **maximum_ride_time** and **maximum_ride_distance** To define a maximum ride distance or duration, you can set the \"maximum_ride_distance\" and \"maximum_ride_time\" parameters with meter and seconds.   ### <a name=\"activities\"></a>**Activities** Describe where an activity take place, when it can be performed and how long it last. ```json   \"activity\": {     \"point_id\": \"visit-point\",     \"timewindows\": [{       \"start\": 3600,       \"end\": 4800     }],     \"duration\": 2100.0   } ``` Some additional parameters are available : * **setup_duration** allow to combine the activities durations performed at the same place  ### <a name=\"services-and-shipments\"></a>**Services and Shipments** Describe more specifically the activities to be performed. Services are single activities which are self-sufficient. ```json   \"services\": [{     \"id\": \"visit\",     \"type\": \"service\",     \"activity\": {       \"point_id\": \"visit-point-1\",       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 2100.0     }   } ``` Shipments are a couple of indivisible activities, the __pickup__ is the action which must take-off a package and the __delivery__ the action which deliver this particular package. __pickup__ and __delivery__ are build following the __activity__ model ```json   \"shipments\": [{     \"id\": \"shipment\",     \"pickup\": {       \"point_id\": \"visit-point-1\",       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }]     },     \"delivery\": {       \"point_id\": \"visit-point-2\",       \"duration\": 2100.0     }   }] ``` ### <a name=\"routes\"></a>**Routes** Routes structure allows you to provide an initial solution. You can provide routes when calling ORtools solver or periodic heuristic. * When using ORtools solver, this route is used as initial solution. That is, we do not use any heuristic to find the first solution but we use provided one. If the route is unfeasible we compute initial solution using a heuristic, as if no route was provided. * When using periodic heuristic, we start from the solution corresponding to provided routes. If one of the missions is not feasible at its position it will be unassigned.  ### <a name=\"matrices\"></a>**Matrices** Describe the topology of the problem, it represent travel time, distance or value between every points, Matrices are not mandatory, if time or distance are not defined the router wrapper will use the points data to build it. ```json   \"matrices\": [{     \"id\": \"matrix-1\",     \"time\": [       [0, 655, 1948, 5231],       [603, 0, 1692, 4977],       [1861, 1636, 0, 6143],       [5184, 4951, 6221, 0]     ]   }] ``` With this matrix defined, the vehicle definition is now the following : ```json   \"vehicles\": [{     \"id\": \"vehicle_id\",     \"matrix_id\": \"matrix-1\",     \"start_point_id\": \"vehicle-start\",     \"end_point_id\": \"vehicle-end\",     \"timewindow\": {       \"start\": 0,       \"end\": 7200     },     \"cost_fixed\": 0.0,     \"cost_distance_multiplier\": 0.0,     \"cost_time_multiplier\": 1.0   }] ``` Note that every vehicle could be linked to different matrices in order to model multiple transport mode.  In the case the distance cost is greater than 0, it will be mandatory to transmit the related matrix ```json   \"matrices\": [{     \"id\": \"matrix-1\",     \"time\": [       [0, 655, 1948, 5231],       [603, 0, 1692, 4977],       [1861, 1636, 0, 6143],       [5184, 4951, 6221, 0]     ],     \"distance\": [       [0, 655, 1948, 5231],       [603, 0, 1692, 4977],       [1861, 1636, 0, 6143],       [5184, 4951, 6221, 0]     ]   }] ``` Whenever there is no time constraint and the objective is only set on distance, the time matrix is not mandatory.  An additional value matrix is available to represent a cost matrix. ### <a name=\"units\"></a>**Units** Describe the dimension used for the goods. ie : kgs, litres, pallets...etc ```json   \"units\": [{     \"id\": \"unit-Kg\",     \"label\": \"Kilogram\"   }] ``` ### <a name=\"capacities\"></a>**Capacities** Define the limit allowed for a defined unit into the vehicle. ```json   \"capacities\": [{     \"unit_id\": \"unit-Kg\",     \"limit\": 10,     \"overload_multiplier\": 0   }] ``` Which is defined as follows ```json   \"vehicles\": [{     \"id\": \"vehicle_id\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"timewindow\": {       \"start\": 0,       \"end\": 7200     },     \"capacities\": [{       \"unit_id\": \"unit-Kg\",       \"limit\": 10,       \"overload_multiplier\": 0     }],     \"start_point_id\": \"vehicle-start\",     \"end_point_id\": \"vehicle-end\",     \"cost_fixed\": 0.0,     \"cost_distance_multiplier\": 0.0,     \"cost_time_multiplier\": 1.0   }] ``` ### <a name=\"quantities\"></a>**Quantities** Inform of the package size, shift within a route once loaded into a vehicle. ```json   \"quantities\": [{     \"unit_id\": \"unit-Kg\",     \"value\": 8   }] ``` ```json   \"services\": [{     \"id\": \"visit\",     \"type\": \"service\",     \"activity\": {       \"point_id\": \"visit-point-1\",       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 2100.0     },     \"quantities\": [{       \"unit_id\": \"unit-Kg\",       \"value\": 8     }]   } ``` ```json   \"shipments\": [{     \"id\": \"pickup_delivery\",     \"pickup\": {       \"point_id\": \"visit-point-1\",       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 2100.0     },     \"delivery\": {       \"point_id\": \"visit-point-2\",       \"timewindows\": [{         \"start\": 4500,         \"end\": 7200       }],       \"duration\": 1100.0     },     \"quantities\": [{       \"unit_id\": \"unit-Kg\",       \"value\": 8     }]   } The \"refill\" parameters allow to let the optimizer decide how many values of the current quantity can be loaded at the current activity. ``` ### <a name=\"rests\"></a>**Rests** Inform about the drivers obligations to have some rest within a route ```json   \"rests\": [{     \"id\": \"Break-1\",     \"timewindows\": [{       \"start\": 1200,       \"end\": 2400     }],     \"duration\": 600   }] ```  ```json   \"vehicles\": [{     \"id\": \"vehicle_id\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"timewindow\": {       \"start\": 0,       \"end\": 7200     },     \"rests_ids\": [\"Break-1\"]     \"start_point_id\": \"vehicle-start\",     \"end_point_id\": \"vehicle-end\",     \"cost_fixed\": 0.0,     \"cost_distance_multiplier\": 0.0,     \"cost_time_multiplier\": 1.0   }] ```  ### <a name=\"relations\"></a>**Relations** Relations allow to define constraints explicitly between activities and/or vehicles. Those could be of the following types:   * **same_route** : force missions to be served within the same route.   * **order** : force services to be served within the same route in a specific order, but allow to insert others missions between   * **sequence** : force services to be served in a specific order, excluding others missions to be performed between   * **meetup** : ensure that some missions are performed at the same time by multiple vehicles.   * **maximum_duration_lapse** : Define a maximum in route duration between two activities.   * **minimum_day_lapse** : Define a minimum number of unworked days between two worked days. For instance, if you what one visit per week, you should use a minimum lapse of 7.   If the first service is assigned on a Monday then, with this minimum lapse, the solver will try to keep all these service's visits on Mondays.   * **maximum_day_lapse** : Define a maximum number of unworked days between two worked days.   * **force_end** : The linked activities are the only which can be set as last of a route. (Only one relation of this kind is considered)   * **force_first** : The linked activities are the only which can be set as first of a route. (Only one relation of this kind is considered)   * **never_first** : The linked activities can't be set as first of a vehicle.   * **vehicle_group_duration** : The sum of linked vehicles duration should not exceed lapse over whole period. Some relations need to be extended over all period. Parameter **periodicity** allows to express recurrence of the relation over the period.  ```json   \"relations\": [{     \"id\": \"sequence_1\",     \"type\": \"sequence\",     \"linked_ids\": [\"service_1\", \"service_3\", \"service_2\"],     \"lapse\": null   }, {     \"id\": \"group_duration\",     \"type\": \"vehicle_group_duration\",     \"linked_vehicle_ids\": [\"vehicle_1\", \"vehicle_2\"],     \"lapse\": 3   }, {     \"id\": \"group_duration\",     \"type\": \"vehicle_group_duration_on_weeks\",     \"linked_vehicle_ids\": [\"vehicle_1\", \"vehicle_2\"],     \"lapse\": 3,     \"periodicity\": 2   }] ```   ### <a name=\"configuration\"></a>**Configuration** The configuration is divided in four parts Preprocessing parameters will twist the problem in order to simplify or orient the solve ```json   \"configuration\": {     \"preprocessing\": {       \"cluster_threshold\": 5,       \"prefer_short_segment\": true     }   } ```  You can ask to apply some clustering method before solving. **partitions** structure specifies which clustering steps should be performed. Each partition step should be defined by a method:   * **balanced_kmeans**   * **hierarchical_tree** Each partition step should be defined by a metric, which will be used to partition:   * **duration**   * **visits**   * any existing unit Each partition step should be defined by a entity:   * **vehicle**   * **work_day**  ```json   \"configuration\": {     \"preprocessing\": {       \"partitions\": [{         \"method\": \"balanced_kmeans\",         \"metric\": \"duration\",         \"entity\": \"vehicle\"       },{         \"method\": \"hierarchical_tree\",         \"metric\": \"visits\",         \"entity\": \"work_day\"       }]     }   } ```  Resolution parameters will only indicate when stopping the search is tolerated. In this case, the solve will last at most 30 seconds and at least 3. If it doesn`t find a new better solution within a time lapse of twice times the duration it takes to find the previous solution, the solve is interrupted. ```json   \"configuration\": {     \"resolution\": {       \"duration\": 30000,       \"minimum_duration\": 3000,       \"time_out_multiplier\": 2     }   } ```  **VROOM** requires no parameters and stops by itself. **ORtools** Can take a maximum solve duration, or can stop by itself depending on the solve state as a time-out between two new best solution, or as a number of iterations without improvement. **Jsprit**: Can take a maximum solve duration, a number of iterations wihtout improvment or a number of iteration without variation in the neighborhood search.  The followings paramaters are available : * **duration** : ORtools, Jsprit * **iterations_without_improvment** : ORtools, Jsprit * **minimum_duration** : ORtools * **time_out_multiplier** : ORtools * **stable_iterations** : Jsprit * **stable_coefficient** : Jsprit  N.B : In most of the case, ORtools is called.  Schedule parameters are only usefull in the case of Schedule Optimisation. Those allow to define the considerated period (__range_indices__) and the indices which are unavailable within the solve (__unavailable_indices__) ```json   \"configuration\": {     \"schedule\": {       \"range_indices\": {         \"start\": 0,         \"end\": 13       },       \"unavailable_indices\": [5, 6, 12, 13]     }   } ``` An alternative exist to those parameters in order to define it by date instead of indices __schedule_range_date__ and __schedule_unavailable_date__.  More specific parameters are also available when dealing with Schedule Optimisation: * **same_point_day** : all services located at the same geografical point will take place on the same days. For instance, two visits at the same location with the same minimum_lapse = maximum_lapse = 7 will be served by same vehicle and will take place on every monday if first visit is assigned to monday. Another exemple : two visits with minimum_lapse = maximum_lapse = 2 will be served by the same vehicle and, if first visit is assigned on tuesday, both second visits will take place on next thursday, third visit will take place on next saturday and so on. * **allow_partial_assignment** : solution is valid even if only a subset of one service's visits are affected. Default : true.  Restitution parameters allow to have some control on the API response ```json   \"configuration\": {     \"restitution\": {       \"geometry\": true,       \"geometry_polyline\": false     }   } ``` __geometry__ inform the API to return the Geojson of the route in output, as a MultiLineString feature __geometry_polyline__ precise that if the geomtry is asked the Geojson must be encoded.   <a name=\"solve\"></a>Solve -- The current API can handle multiple particular behaviors. **first_solution_strategy** parameter forces a particular behavior in order to find first solution. In the remainder, 'a', 'b' and 'c' are heuristic names. Currently, 8 heuristics are available with ORtools : *   **path_cheapest_arc** : Connect start node to the node which produces the cheapest route segment, then extend the route by iterating on the last node added to the route. *   **global_cheapest_arc** : Iteratively connect two nodes which produce the cheapest route segment. *   **local_cheapest_insertion** : Insert nodes at their cheapest position. *   **savings** : The savings value is the difference between the cost of two routes visiting one node each and one route visiting both nodes. *   **parallel_cheapest_insertion** : Insert nodes at their cheapest position on any route; potentially several routes can be built in parallel. *   **first_unbound : First unbound minimum value** : Select the first node with an unbound successor and connect it to the first available node (default). *   **christofides** : Extends route until no nodes can be inserted on it. *   **periodic** : Heuristic for problems with periodicity.  Currently, 3 behaviors are available with **first_solution_strategy** : * **'a,b,c'** : Test these heuristics and provide to full resolution the one which provided the best solution. There should be at least 2 and at most 3 heuristics provided. periodic heuristic should not be used in this case since it is not applied on the same category of problems. * **'self_selection'** : Same as previous, but list is an internal selection of heuristics. * **'a'** : Forces the solver to use this specific heuristic.  ```json   \"configuration\": {     \"preprocessing\": {       \"first_solution_strategy\": \"savings,christofides,first_unbound\"     }   } ```  ```json   \"configuration\": {     \"preprocessing\": {       \"first_solution_strategy\": \"self_selection\"     }   } ```  ```json   \"configuration\": {     \"preprocessing\": {       \"first_solution_strategy\": \"periodic\"     },     \"schedule\": {       \"range_indices\": {         \"start\": 0,         \"end\": 10       }     }   } ```  ### <a name=\"lateness\"></a>Lateness¹ Once defined at the service level it allow the vehicles to arrive late at a points to serve. ```json   \"services\": [{     \"id\": \"visit\",     \"type\": \"service\",     \"activity\": {       \"point_id\": \"visit-point-1\",       \"late_multiplier\": 0.3,       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 2100.0     }   } ``` Defined at the vehicle level, it allow the vehicle to arrive late at the ending depot. ```json   \"vehicles\": [{     \"id\": \"vehicle_id-1\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"timewindow\": {       \"start\": 0,       \"end\": 7200     },     \"start_point_id\": \"vehicle-start-1\",     \"end_point_id\": \"vehicle-start-1\",     \"cost_fixed\": 500.0,     \"cost_late_multiplier\", 0.3,     \"cost_distance_multiplier\": 1.0,     \"cost_time_multiplier\": 1.0   }] ``` Note : In the case of a global optimization, at least one those two parameters (__late_multiplier__ or __cost_late_multiplier__) must be set to zero, otherwise only one vehicle would be used. ### <a name=\"multiple-vehicles\"></a>Multiple vehicles ```json   \"vehicles\": [{     \"id\": \"vehicle_id-1\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"timewindow\": {       \"start\": 0,       \"end\": 7200     },     \"start_point_id\": \"vehicle-start\",     \"end_point_id\": \"vehicle-end\",     \"cost_fixed\": 500.0,     \"cost_distance_multiplier\": 1.0,     \"cost_time_multiplier\": 1.0   },{     \"id\": \"vehicle_id-2\",     \"router_mode\": \"truck\",     \"router_dimension\": \"distance\",     \"speed_multiplier\": 0.9,     \"timewindow\": {       \"start\": 8900,       \"end\": 14400     },     \"start_point_id\": \"vehicle-start\",     \"end_point_id\": \"vehicle-end\",     \"cost_fixed\": 4000.0,     \"cost_distance_multiplier\": 0.60,     \"cost_time_multiplier\": 0   }] ``` ### <a name=\"multiple-depots\"></a>Multiple depots Depots can be set to any points or stay free (in such case don't send the associated key word) ```json   \"vehicles\": [{     \"id\": \"vehicle_id-1\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"start_point_id\": \"vehicle-start-1\",     \"end_point_id\": \"vehicle-start-1\",     \"cost_fixed\": 500.0,     \"cost_distance_multiplier\": 1.0,     \"cost_time_multiplier\": 1.0   }, {     \"id\": \"vehicle_id-2\",     \"router_mode\": \"truck\",     \"router_dimension\": \"distance\",     \"speed_multiplier\": 0.9,     \"start_point_id\": \"vehicle-start-2\",     \"end_point_id\": \"vehicle-end-2\",     \"cost_fixed\": 4000.0,     \"cost_distance_multiplier\": 0.60,     \"cost_time_multiplier\": 0   }, {     \"id\": \"vehicle_id-2\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"end_point_id\": \"vehicle-end-2\",     \"cost_fixed\": 500.0,     \"cost_distance_multiplier\": 1.0,     \"cost_time_multiplier\": 1.0   }] ``` ### <a name=\"multiple-matrices\"></a>Multiple matrices¹ Every vehicle can have its own matrix to represent its custom speed or route behavior. ```json   \"matrices\": [{     \"id\": \"matrix-1\",     \"time\": [       [0, 655, 1948, 5231],       [603, 0, 1692, 4977],       [1861, 1636, 0, 6143],       [5184, 4951, 6221, 0]     ]   }, {     \"id\": \"matrix-2\",     \"time\": [       [0, 541, 1645, 4800],       [530, 0, 1503, 4465],       [1506, 1298, 0, 5836],       [4783, 4326, 5760, 0]     ]   }] ``` ### <a name=\"multiple-timewindows\"></a>Multiple TimeWindows ```json   \"services\": [{     \"id\": \"visit\",     \"type\": \"service\",     \"activity\": {       \"point_id\": \"visit-point-1\",       \"timewindows\": [{         \"start\": 1200,         \"end\": 2400       }, {         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 2100.0     }   } ``` ### <a name=\"pickup-or-delivery\"></a>Pickup or Delivery Services can be set with a __pickup__ or a __delivery__ type which inform the solver about the activity to perform. The __pickup__ allows a reload action within the route, the __delivery__ allows to drop off resources. ```json   \"services\": [{     \"id\": \"visit-pickup\",     \"type\": \"pickup\",     \"activity\": {       \"point_id\": \"visit-point-1\",       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 2100.0     },     \"quantities\": [{       \"unit_id\": \"unit-Kg\",       \"value\": 8     }]   }, {     \"id\": \"visit-delivery\",     \"type\": \"delivery\",     \"activity\": {       \"point_id\": \"visit-point-2\",       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 2100.0     },     \"quantities\": [{       \"unit_id\": \"unit-Kg\",       \"value\": 6     }]   }] ``` ### <a name=\"priority\"></a>Priority and Exclusion cost¹ Priority ndicate to the solver which activities are the most important, the priority 0 is two times more important than a priority 1 which is itself two times more important than a priority 2 and so on until the priority 8. The default value is 4. ```json  \"services\": [{     \"id\": \"visit-1\",     \"type\": \"service\",     \"activity\": {       \"point_id\": \"visit-point-1\",       \"late_multiplier\": 0.3,       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 600.0,       \"priority\": 0     }   }, {     \"id\": \"visit-2\",     \"type\": \"service\",     \"activity\": {       \"point_id\": \"visit-point-1\",       \"late_multiplier\": 0.3,       \"timewindows\": [{         \"start\": 3800,         \"end\": 5000       }],       \"duration\": 600.0,       \"priority\": 2     }   }] ``` The \"exclusion_cost\" parameter override the priority and define at which cost the current activity can be unassigned. ### <a name=\"quantities-overload\"></a>Quantities overload¹ Allow the vehicles to load more than the defined limit, but add a cost at every excess unit. ```json   \"vehicles\": [{     \"id\": \"vehicle_id\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"capacities\": [{       \"unit_id\": \"unit-Kg\",       \"limit\": 10,       \"overload_multiplier\": 0.3     }],     \"start_point_id\": \"vehicle-start\",     \"end_point_id\": \"vehicle-end\",     \"cost_fixed\": 0.0,     \"cost_distance_multiplier\": 0.0,     \"cost_time_multiplier\": 1.0   }] ``` ### <a name=\"setup-duration\"></a>Setup duration When multiple activities are performed at the same location in a direct sequence it allows to have a common time of preparation. It Could be assimilated to an administrative time. ```json  \"services\": [{     \"id\": \"visit-1\",     \"type\": \"service\",     \"activity\": {       \"point_id\": \"visit-point-1\",       \"late_multiplier\": 0.3,       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 600.0,       \"setup_duration\": 1500.0     }   }, {     \"id\": \"visit-2\",     \"type\": \"service\",     \"activity\": {       \"point_id\": \"visit-point-1\",       \"late_multiplier\": 0.3,       \"timewindows\": [{         \"start\": 3800,         \"end\": 5000       }],       \"duration\": 600.0,       \"setup_duration\": 1500.0     }   }] ``` If those two services are performed in a row, the cumulated time of activity will be : 1500 + 600 + 600 = 2700 instead of 4200 if the two duration were set to 2100. ### <a name=\"skills\"></a>Skills Some package must be carried by some particular vehicle, or some points can only be visited by some particular vehicle or driver. Skills allow to represent those kind of constraints. A vehicle can carry the __services__ or __shipments__ with the defined __skills__ and the ones which have none or part of the current vehicle skills. ```json   \"vehicles\": [{     \"id\": \"vehicle_id\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"start_point_id\": \"vehicle-start\",     \"end_point_id\": \"vehicle-end\",     \"skills\": [         [\"frozen\"]       ]     \"cost_fixed\": 0.0,     \"cost_distance_multiplier\": 0.0,     \"cost_time_multiplier\": 1.0   }] ``` Missions must be carried by a vehicle which have at least all the required skills by the current service or shipment. ```json   \"services\": [{     \"id\": \"visit\",     \"type\": \"service\",     \"activity\": {       \"point_id\": \"visit-point-1\",       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 2100.0     },     \"skills\": [\"frozen\"]   } ``` ### <a name=\"alternative-skills\"></a>Alternative Skills³ Some vehicles can change its __skills__ once empty, passing from one configuration to another. Here passing from a configuration it can carry only cool products from another it can only tool frozen ones and vice versa. ```json   \"vehicles\": [{     \"id\": \"vehicle_id\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"start_point_id\": \"vehicle-start\",     \"end_point_id\": \"vehicle-end\",     \"skills\": [         [\"cool\"],         [\"frozen\"]       ]     \"cost_fixed\": 0.0,     \"cost_distance_multiplier\": 0.0,     \"cost_time_multiplier\": 1.0   }] ``` ```json   \"services\": [{     \"id\": \"visit-1\",     \"type\": \"service\",     \"activity\": {       \"point_id\": \"visit-point-1\",       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 2100.0     },     \"skills\": [\"frozen\"]   }, {     \"id\": \"visit-2\",     \"type\": \"service\",     \"activity\": {       \"point_id\": \"visit-point-2\",       \"timewindows\": [{         \"start\": 3600,         \"end\": 4800       }],       \"duration\": 2100.0     },     \"skills\": [\"cool\"]   }] ```  <a name=\"schedule-optimisation\"></a>Schedule Optimisation ==  <a name=\"problem-definition\"></a>Problem definition ---  The plan must be described in its general way, the schedule duration the begin and end days or indices. Some day may have to be exclude from the resolution, like holiday, and could be defined by its days or indices. ```json   \"configuration\": {       \"preprocessing\": {           \"prefer_short_segment\": true       },       \"resolution\": {           \"duration\": 1000,           \"iterations_without_improvment\": 100       },       \"schedule\": {           \"range_indices\": {               \"start\": 0,               \"end\": 13           },           \"unavailable_indices\": [2]       }   }  ```  <a name=\"vehicle-definition\"></a>Vehicle definition ---  The timewindows of a vehicle over a week can be defined with an array using __sequence_timewindows__ instead of a single timewindow. To link a timewindow with a week day, a __day_index can__ be set (from 0 [monday] to 6 [sunday]). Those time slot will repeated over the entire period for every week contained. As at the problem definition level, some days could be unavailable to a specific vehicle, this can be defined with __unavailable_work_date__ or __unavailable_work_day_indices__ ```json   {     \"id\": \"vehicle_id-1\",     \"router_mode\": \"car\",     \"router_dimension\": \"time\",     \"speed_multiplier\": 1.0,     \"sequence_timewindows\": [{         \"day_index\": 0,         \"start\": 25200,         \"end\": 57600     }, {         \"day_index\": 1,         \"start\": 25200,         \"end\": 57600     }, {         \"day_index\": 2,         \"start\": 25200,         \"end\": 57600     }, {         \"day_index\": 3,         \"start\": 25200,         \"end\": 57600     }, {         \"day_index\": 4,         \"start\": 25200,         \"end\": 57600     }],     \"start_point_id\": \"store\",     \"end_point_id\": \"store\",     \"unavailable_work_day_indices\": [5, 7]   } ```  <a name=\"services-definition\"></a>Services definition ---  As the vehicles, services have period defined timewindows, using __day_index__ parameter within its timewindows. And some days could be not available to deliver a customer, which can be defined with __unavailable_visit_day_indices__ or __unavailable_visit_day_date__ Some visits could be avoided because it is not mandatory, or any particular reason, __unavailable_visit_indices__ allow to not include a particular visit over the period. To define multiple visit of a customer over the period, you can set it through the __visits_number__ field. By default, it will divide the period by the number of visits in order to non overlap the multiple visits. ```json   {     \"id\": \"visit-1\",     \"type\": \"service\",     \"activity\": {         \"point_id\": \"visit-point-1\",         \"timewindows\": [{             \"day_index\": 0,             \"start\": 28800,             \"end\": 64800         }, {             \"day_index\": 0,             \"start\": 61200,             \"end\": 97200         }, {             \"day_index\": 2,             \"start\": 28800,             \"end\": 64800         }, {             \"day_index\": 3,             \"start\": 28800,             \"end\": 64800         }, {             \"day_index\": 4,             \"start\": 28800,             \"end\": 64800         }],         \"duration\": 1200.0     },     \"visits_number\": 2   } ``` N.B: Shipments are currently not available within the schedule optimisation  <a name=\"additional-parameters\"></a>Additional parameters ---  ### <a name=\"min-max-lapse\"></a>**Minimum/Maximum Lapse** Between to visits of the same mission, it could be necessary to determine exactly the lapse. At this purpose, the __minimum_lapse__ and __maximum_lapse__ fields of services are available. ```json   {     \"id\": \"visit-1\",     \"type\": \"service\",     \"activity\": {         \"point_id\": \"visit-point-1\",         \"timewindows\": [{             \"day_index\": 0,             \"start\": 28800,             \"end\": 64800         }, {             \"day_index\": 0,             \"start\": 61200,             \"end\": 97200         }, {             \"day_index\": 2,             \"start\": 28800,             \"end\": 64800         }, {             \"day_index\": 3,             \"start\": 28800,             \"end\": 64800         }, {             \"day_index\": 4,             \"start\": 28800,             \"end\": 64800         }],         \"duration\": 1200.0     },     \"visits_number\": 2,     \"minimum_lapse\": 7,     \"maximum_lapse\": 14   } ```  <a name=\"zones\"></a>Zones ==  In order to distribute geographically the problem, some sector can be defined. The API takes geojson and encrypted geojson. A zone contains the vehicles which are allowed to perform it at the same time. The API call make it feasible to have multiple elaborate combinations. But only a single complex combination (multiple vehicles allowed to perform activities within the area at the same time). ```json       \"zones\": [{         \"id\": \"zone_0\",         \"polygon\": {         \"type\": \"Polygon\",         \"coordinates\": [[[0.5,48.5],[1.5,48.5],[1.5,49.5],[0.5,49.5],[0.5,48.5]]]         },         \"allocations\": [[\"vehicle_0\", \"vehicle_1\"]]       }] ``` Or multiple unique vehicle alternative are currently implemented at the solver side. ```json       \"zones\": [{         \"id\": \"zone_0\",         \"polygon\": {         \"type\": \"Polygon\",         \"coordinates\": [[[0.5,48.5],[1.5,48.5],[1.5,49.5],[0.5,49.5],[0.5,48.5]]]         },         \"allocations\": [[\"vehicle_0\"], [\"vehicle_1\"]]       }] ``` 

OpenAPI spec version: 0.1.0
Contact: tech@mapotempo.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.12

=end

require 'date'

module OptimizerClient
  class Post01VrpSubmitServices
    attr_accessor :id

    # Priority assigned to the service in case of conflict to assign every jobs (from 0 to 8, default is 4. 0 is the highest priority level). Not available with same_point_day option.
    attr_accessor :priority

    # Exclusion cost. Not available with periodic heuristic.
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

    # Defined to which vehicle the service is assigned
    attr_accessor :sticky_vehicle_ids

    # Particular abilities required by a vehicle to perform this service
    attr_accessor :skills

    # service, pickup or delivery
    attr_accessor :type

    attr_accessor :activity

    attr_accessor :activities

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
        :'sticky_vehicle_ids' => :'sticky_vehicle_ids',
        :'skills' => :'skills',
        :'type' => :'type',
        :'activity' => :'activity',
        :'activities' => :'activities',
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
        :'unavailable_visit_indices' => :'Array<Integer>',
        :'unavailable_visit_day_indices' => :'Array<Integer>',
        :'minimum_lapse' => :'Float',
        :'maximum_lapse' => :'Float',
        :'sticky_vehicle_ids' => :'Array<String>',
        :'skills' => :'Array<String>',
        :'type' => :'String',
        :'activity' => :'Post01VrpSubmitVrpActivity',
        :'activities' => :'Array<Post01VrpSubmitVrpActivity>',
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
      else
        self.visits_number = 1
      end

      if attributes.has_key?(:'unavailable_visit_indices')
        if (value = attributes[:'unavailable_visit_indices']).is_a?(Array)
          self.unavailable_visit_indices = value
        end
      end

      if attributes.has_key?(:'unavailable_visit_day_indices')
        if (value = attributes[:'unavailable_visit_day_indices']).is_a?(Array)
          self.unavailable_visit_day_indices = value
        end
      end

      if attributes.has_key?(:'minimum_lapse')
        self.minimum_lapse = attributes[:'minimum_lapse']
      end

      if attributes.has_key?(:'maximum_lapse')
        self.maximum_lapse = attributes[:'maximum_lapse']
      end

      if attributes.has_key?(:'sticky_vehicle_ids')
        if (value = attributes[:'sticky_vehicle_ids']).is_a?(Array)
          self.sticky_vehicle_ids = value
        end
      end

      if attributes.has_key?(:'skills')
        if (value = attributes[:'skills']).is_a?(Array)
          self.skills = value
        end
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'activity')
        self.activity = attributes[:'activity']
      end

      if attributes.has_key?(:'activities')
        if (value = attributes[:'activities']).is_a?(Array)
          self.activities = value
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

      if !@priority.nil? && @priority > 8
        invalid_properties.push('invalid value for "priority", must be smaller than or equal to 8.')
      end

      if !@priority.nil? && @priority < 0
        invalid_properties.push('invalid value for "priority", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @id.nil?
      return false if !@priority.nil? && @priority > 8
      return false if !@priority.nil? && @priority < 0
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] priority Value to be assigned
    def priority=(priority)
      if !priority.nil? && priority > 8
        fail ArgumentError, 'invalid value for "priority", must be smaller than or equal to 8.'
      end

      if !priority.nil? && priority < 0
        fail ArgumentError, 'invalid value for "priority", must be greater than or equal to 0.'
      end

      @priority = priority
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
          sticky_vehicle_ids == o.sticky_vehicle_ids &&
          skills == o.skills &&
          type == o.type &&
          activity == o.activity &&
          activities == o.activities &&
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
      [id, priority, exclusion_cost, visits_number, unavailable_visit_indices, unavailable_visit_day_indices, minimum_lapse, maximum_lapse, sticky_vehicle_ids, skills, type, activity, activities, quantities].hash
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
