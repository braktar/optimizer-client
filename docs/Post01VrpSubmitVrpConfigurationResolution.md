# OptimizerClient::Post01VrpSubmitVrpConfigurationResolution

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**duration** | **Integer** | Maximum duration of resolution | [optional] 
**iterations_without_improvment** | **Integer** | Maximum number of iterations without improvment from the best solution already found | [optional] 
**minimum_duration** | **Integer** | Minimum solve duration before the solve could stop (x10 in order to find the first solution) (ORtools only) | [optional] 
**time_out_multiplier** | **Integer** | The solve could stop itself if the solve duration without finding a new solution is greater than the time currently elapsed multiplicate by this parameter (ORtools only) | [optional] 
**vehicle_limit** | **Integer** | Limit the maxiumum number of vehicles within a solution. Not available with periodic heuristic. | [optional] 
**solver** | **BOOLEAN** | Defines if solver should be called | [optional] 
**minimize_days_worked** | **BOOLEAN** | (Scheduling heuristic only) Starts filling earlier days of the period first and minimizes the total number of days worked. Available only if first_solution_strategy is &#39;periodic&#39;. Not available with ORtools. | [optional] 
**same_point_day** | **BOOLEAN** | (Scheduling only) Forces all services with the same point_id to take place on the same days. Available only if first_solution_strategy is &#39;periodic&#39;. Not available ORtools. | [optional] 
**allow_partial_assignment** | **BOOLEAN** | (Scheduling heuristic only) Considers a solution as valid even if only a subset of the visits of a service is performed. If disabled, a service can only appear fully assigned or fully unassigned in the solution. Not available with ORtools. | [optional] [default to true]
**split_number** | **Integer** | Give the current number of process for block call | [optional] 
**evaluate_only** | **BOOLEAN** | Takes the solution provided through relations of type order and computes solution cost and time/distance associated values (Ortools only). Not available for scheduling yet. | [optional] 
**several_solutions** | **Integer** | Return several solution computed with different matrices | [optional] [default to 1]
**batch_heuristic** | **BOOLEAN** | Compute each heuristic solution | [optional] 
**variation_ratio** | **Integer** | Value of the ratio that will change the matrice | [optional] 


