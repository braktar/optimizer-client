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
  class Post01VrpSubmitVehicles
    attr_accessor :id

    # Cost applied if the vehicle is used
    attr_accessor :cost_fixed

    # Cost applied to the distance performed
    attr_accessor :cost_distance_multiplier

    # Cost applied to the total amount of time of travel (Jsprit) or to the total time of route (ORtools)
    attr_accessor :cost_time_multiplier

    # Multiplier applied to the value matrix and additional activity value
    attr_accessor :cost_value_multiplier

    # Cost applied to the waiting time in the route (Jsprit Only)
    attr_accessor :cost_waiting_time_multiplier

    # Cost applied if a point is delivered late (ORtools only)
    attr_accessor :cost_late_multiplier

    # Cost applied on the setup duration (Jsprit only)
    attr_accessor :cost_setup_time_multiplier

    # Coefficient applied to every setup duration defined in the tour, for this vehicle
    attr_accessor :coef_setup

    # Constant additional setup duration for all setup defined in the tour, for this vehicle
    attr_accessor :additional_setup

    # Coefficient applied to every service duration defined in the tour, for this vehicle
    attr_accessor :coef_service

    # Constant additional service time for all travel defined in the tour, for this vehicle
    attr_accessor :additional_service

    # [ DEPRECATED ]
    attr_accessor :force_start

    # Force the vehicle to start as soon as the vehicle timewindow is open, as late as possible or let vehicule start at any time. Not available with periodic heuristic.
    attr_accessor :shift_preference

    # Describe the number of return to the depot a vehicle is allowed to perform within its route
    attr_accessor :trips

    # Related matrix, if already defined
    attr_accessor :matrix_id

    # If any value matrix defined, related matrix index.
    attr_accessor :value_matrix_id

    # car, truck, bicycle...etc. See the Router Wrapper API doc
    attr_accessor :router_mode

    # time or dimension, choose between a matrix based on minimal route duration or on minimal route distance
    attr_accessor :router_dimension

    # Multiplies the vehicle speed, default : 1.0. Specifies if this vehicle is faster or slower than average speed.
    attr_accessor :speed_multiplier

    # Speed multiplier per area, 0 to avoid area. Areas separated with pipes (only available for truck mode at this time).
    attr_accessor :speed_multiplier_area

    # Take into account traffic or not.
    attr_accessor :traffic

    # Departure date time (only used if router supports traffic).
    attr_accessor :departure

    # Use track or not.
    attr_accessor :track

    # Use motorway or not.
    attr_accessor :motorway

    # Use toll section or not.
    attr_accessor :toll

    # Number of trailers.
    attr_accessor :trailers

    # Vehicle weight including trailers and shipped goods, in tons.
    attr_accessor :weight

    # Weight per axle, in tons.
    attr_accessor :weight_per_axle

    # Height in meters.
    attr_accessor :height

    # Width in meters.
    attr_accessor :width

    # Length in meters.
    attr_accessor :length

    # List of hazardous materials in the vehicle.
    attr_accessor :hazardous_goods

    # Max distance by walk.
    attr_accessor :max_walk_distance

    # Arrive/Leave in the traffic direction.
    attr_accessor :approach

    # Snap waypoint to junction close by snap distance.
    attr_accessor :snap

    # Strict compliance with truck limitations.
    attr_accessor :strict_restriction

    # Maximum tour duration
    attr_accessor :duration

    # [planning] If schedule covers several days, maximum work duration over whole period. Not available with periodic heuristic.
    attr_accessor :overall_duration

    # Maximum tour distance. Not available with periodic heuristic.
    attr_accessor :distance

    # Maximum ride duration between two route activities
    attr_accessor :maximum_ride_time

    # Maximum ride distance between two route activities
    attr_accessor :maximum_ride_distance

    # Particular abilities which could be handle by the vehicle. Not available with periodic heuristic. This parameter is a set of alternative skills, and must be defined as an Array[Array[String]]
    attr_accessor :skills

    # [planning] Express the exceptionnals indices of unavailabilty
    attr_accessor :unavailable_work_day_indices

    # Do not take into account the route leaving the depot in the objective. Not available with periodic heuristic.
    attr_accessor :free_approach

    # Do not take into account the route arriving at the depot in the objective. Not available with periodic heuristic.
    attr_accessor :free_return

    # Begin of the tour
    attr_accessor :start_point_id

    # End of the tour
    attr_accessor :end_point_id

    # Sequence timewindows to consider
    attr_accessor :timewindow_id

    # Breaks whithin the tour
    attr_accessor :rest_ids

    attr_accessor :capacities

    attr_accessor :sequence_timewindows

    attr_accessor :timewindow

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
        :'cost_fixed' => :'cost_fixed',
        :'cost_distance_multiplier' => :'cost_distance_multiplier',
        :'cost_time_multiplier' => :'cost_time_multiplier',
        :'cost_value_multiplier' => :'cost_value_multiplier',
        :'cost_waiting_time_multiplier' => :'cost_waiting_time_multiplier',
        :'cost_late_multiplier' => :'cost_late_multiplier',
        :'cost_setup_time_multiplier' => :'cost_setup_time_multiplier',
        :'coef_setup' => :'coef_setup',
        :'additional_setup' => :'additional_setup',
        :'coef_service' => :'coef_service',
        :'additional_service' => :'additional_service',
        :'force_start' => :'force_start',
        :'shift_preference' => :'shift_preference',
        :'trips' => :'trips',
        :'matrix_id' => :'matrix_id',
        :'value_matrix_id' => :'value_matrix_id',
        :'router_mode' => :'router_mode',
        :'router_dimension' => :'router_dimension',
        :'speed_multiplier' => :'speed_multiplier',
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
        :'duration' => :'duration',
        :'overall_duration' => :'overall_duration',
        :'distance' => :'distance',
        :'maximum_ride_time' => :'maximum_ride_time',
        :'maximum_ride_distance' => :'maximum_ride_distance',
        :'skills' => :'skills',
        :'unavailable_work_day_indices' => :'unavailable_work_day_indices',
        :'free_approach' => :'free_approach',
        :'free_return' => :'free_return',
        :'start_point_id' => :'start_point_id',
        :'end_point_id' => :'end_point_id',
        :'timewindow_id' => :'timewindow_id',
        :'rest_ids' => :'rest_ids',
        :'capacities' => :'capacities',
        :'sequence_timewindows' => :'sequence_timewindows',
        :'timewindow' => :'timewindow'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'String',
        :'cost_fixed' => :'Float',
        :'cost_distance_multiplier' => :'Float',
        :'cost_time_multiplier' => :'Float',
        :'cost_value_multiplier' => :'Float',
        :'cost_waiting_time_multiplier' => :'Float',
        :'cost_late_multiplier' => :'Float',
        :'cost_setup_time_multiplier' => :'Float',
        :'coef_setup' => :'Float',
        :'additional_setup' => :'Float',
        :'coef_service' => :'Float',
        :'additional_service' => :'Float',
        :'force_start' => :'BOOLEAN',
        :'shift_preference' => :'String',
        :'trips' => :'Integer',
        :'matrix_id' => :'String',
        :'value_matrix_id' => :'String',
        :'router_mode' => :'String',
        :'router_dimension' => :'String',
        :'speed_multiplier' => :'Float',
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
        :'duration' => :'String',
        :'overall_duration' => :'String',
        :'distance' => :'Integer',
        :'maximum_ride_time' => :'Integer',
        :'maximum_ride_distance' => :'Integer',
        :'skills' => :'Array<String>',
        :'unavailable_work_day_indices' => :'Array<Integer>',
        :'free_approach' => :'BOOLEAN',
        :'free_return' => :'BOOLEAN',
        :'start_point_id' => :'String',
        :'end_point_id' => :'String',
        :'timewindow_id' => :'String',
        :'rest_ids' => :'Array<String>',
        :'capacities' => :'Array<Post01VrpSubmitVrpCapacities>',
        :'sequence_timewindows' => :'Array<Post01VrpSubmitVrpTimewindows>',
        :'timewindow' => :'Post01VrpSubmitTimewindows'
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

      if attributes.has_key?(:'cost_setup_time_multiplier')
        self.cost_setup_time_multiplier = attributes[:'cost_setup_time_multiplier']
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

      if attributes.has_key?(:'force_start')
        self.force_start = attributes[:'force_start']
      end

      if attributes.has_key?(:'shift_preference')
        self.shift_preference = attributes[:'shift_preference']
      end

      if attributes.has_key?(:'trips')
        self.trips = attributes[:'trips']
      end

      if attributes.has_key?(:'matrix_id')
        self.matrix_id = attributes[:'matrix_id']
      end

      if attributes.has_key?(:'value_matrix_id')
        self.value_matrix_id = attributes[:'value_matrix_id']
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

      if attributes.has_key?(:'speed_multiplier_area')
        if (value = attributes[:'speed_multiplier_area']).is_a?(Array)
          self.speed_multiplier_area = value
        end
      end

      if attributes.has_key?(:'traffic')
        self.traffic = attributes[:'traffic']
      else
        self.traffic = true
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

      if attributes.has_key?(:'duration')
        self.duration = attributes[:'duration']
      end

      if attributes.has_key?(:'overall_duration')
        self.overall_duration = attributes[:'overall_duration']
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

      if attributes.has_key?(:'free_approach')
        self.free_approach = attributes[:'free_approach']
      end

      if attributes.has_key?(:'free_return')
        self.free_return = attributes[:'free_return']
      end

      if attributes.has_key?(:'start_point_id')
        self.start_point_id = attributes[:'start_point_id']
      end

      if attributes.has_key?(:'end_point_id')
        self.end_point_id = attributes[:'end_point_id']
      end

      if attributes.has_key?(:'timewindow_id')
        self.timewindow_id = attributes[:'timewindow_id']
      end

      if attributes.has_key?(:'rest_ids')
        if (value = attributes[:'rest_ids']).is_a?(Array)
          self.rest_ids = value
        end
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

      if attributes.has_key?(:'timewindow')
        self.timewindow = attributes[:'timewindow']
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
      shift_preference_validator = EnumAttributeValidator.new('String', ['force_start', 'force_end', 'minimize_span'])
      return false unless shift_preference_validator.valid?(@shift_preference)
      router_dimension_validator = EnumAttributeValidator.new('String', ['time', 'distance'])
      return false unless router_dimension_validator.valid?(@router_dimension)
      hazardous_goods_validator = EnumAttributeValidator.new('String', ['explosive', 'gas', 'flammable', 'combustible', 'organic', 'poison', 'radio_active', 'corrosive', 'poisonous_inhalation', 'harmful_to_water', 'other'])
      return false unless hazardous_goods_validator.valid?(@hazardous_goods)
      approach_validator = EnumAttributeValidator.new('String', ['unrestricted', 'curb'])
      return false unless approach_validator.valid?(@approach)
      true
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

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          cost_fixed == o.cost_fixed &&
          cost_distance_multiplier == o.cost_distance_multiplier &&
          cost_time_multiplier == o.cost_time_multiplier &&
          cost_value_multiplier == o.cost_value_multiplier &&
          cost_waiting_time_multiplier == o.cost_waiting_time_multiplier &&
          cost_late_multiplier == o.cost_late_multiplier &&
          cost_setup_time_multiplier == o.cost_setup_time_multiplier &&
          coef_setup == o.coef_setup &&
          additional_setup == o.additional_setup &&
          coef_service == o.coef_service &&
          additional_service == o.additional_service &&
          force_start == o.force_start &&
          shift_preference == o.shift_preference &&
          trips == o.trips &&
          matrix_id == o.matrix_id &&
          value_matrix_id == o.value_matrix_id &&
          router_mode == o.router_mode &&
          router_dimension == o.router_dimension &&
          speed_multiplier == o.speed_multiplier &&
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
          duration == o.duration &&
          overall_duration == o.overall_duration &&
          distance == o.distance &&
          maximum_ride_time == o.maximum_ride_time &&
          maximum_ride_distance == o.maximum_ride_distance &&
          skills == o.skills &&
          unavailable_work_day_indices == o.unavailable_work_day_indices &&
          free_approach == o.free_approach &&
          free_return == o.free_return &&
          start_point_id == o.start_point_id &&
          end_point_id == o.end_point_id &&
          timewindow_id == o.timewindow_id &&
          rest_ids == o.rest_ids &&
          capacities == o.capacities &&
          sequence_timewindows == o.sequence_timewindows &&
          timewindow == o.timewindow
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, cost_fixed, cost_distance_multiplier, cost_time_multiplier, cost_value_multiplier, cost_waiting_time_multiplier, cost_late_multiplier, cost_setup_time_multiplier, coef_setup, additional_setup, coef_service, additional_service, force_start, shift_preference, trips, matrix_id, value_matrix_id, router_mode, router_dimension, speed_multiplier, speed_multiplier_area, traffic, departure, track, motorway, toll, trailers, weight, weight_per_axle, height, width, length, hazardous_goods, max_walk_distance, approach, snap, strict_restriction, duration, overall_duration, distance, maximum_ride_time, maximum_ride_distance, skills, unavailable_work_day_indices, free_approach, free_return, start_point_id, end_point_id, timewindow_id, rest_ids, capacities, sequence_timewindows, timewindow].hash
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
