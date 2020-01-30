# OptimizerClient::Post01VrpSubmitVrpConfigurationResolution

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**duration** | **Integer** | Maximum duration of resolution | [optional] 
**iterations** | **Integer** | Maximum number of iterations (Jsprit only) | [optional] 
**iterations_without_improvment** | **Integer** | Maximum number of iterations without improvment from the best solution already found | [optional] 
**stable_iterations** | **Integer** | maximum number of iterations without variation in the solve bigger than the defined coefficient (Jsprit only) | [optional] 
**stable_coefficient** | **Float** | variation coefficient related to stable_iterations (Jsprit only) | [optional] 
**initial_time_out** | **Integer** | [ DEPRECATED : use minimum_duration instead] | [optional] 
**minimum_duration** | **Integer** | Minimum solve duration before the solve could stop (x10 in order to find the first solution) (ORtools only) | [optional] 
**time_out_multiplier** | **Integer** | the solve could stop itself if the solve duration without finding a new solution is greater than the time currently elapsed multiplicate by this parameter (ORtools only) | [optional] 
**vehicle_limit** | **Integer** | Limit the maxiumum number of vehicles within a solution. Not available with periodic heuristic. | [optional] 
**solver_parameter** | **Integer** | [ DEPRECATED : use preprocessing_first_solution_strategy instead ] | [optional] 
**solver** | **BOOLEAN** | Defines if solver should be called. | [optional] [default to true]
**same_point_day** | **BOOLEAN** | [planning] Forces all services with the same point_id to take place on the same days. Only available if first_solution_strategy is periodic is activated. Not available ORtools. | [optional] 
**allow_partial_assignment** | **BOOLEAN** | [planning] Assumes solution is valid even if only a subset of one service&#39;s visits are affected. Default: true. Not available ORtools. | [optional] [default to true]
**split_number** | **Integer** | Give the current number of process for block call | [optional] 
**evaluate_only** | **BOOLEAN** | Takes the solution provided through relations of type order and computes solution cost and time/distance associated values (Ortools only). Not available for scheduling yet. | [optional] 
**several_solutions** | **Integer** | Return several solution computed with different matrices | [optional] 
**variation_ratio** | **Integer** | Value of the ratio that will change the matrice | [optional] 


