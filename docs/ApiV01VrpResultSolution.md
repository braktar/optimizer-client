# OptimizerClient::ApiV01VrpResultSolution

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**heuristic_synthesis** | **Object** | When first_solution_strategies are provided, sum up of tryied heuristics and their performance. | [optional] 
**solvers** | **Array&lt;String&gt;** | Solvers used to perform the optimization | [optional] 
**cost** | **Float** | The actual cost of the solution considering all costs | [optional] 
**cost_details** | [**ApiV01VRPResultDetailedCosts**](ApiV01VRPResultDetailedCosts.md) | The detail of the different costs which impact the solution | [optional] 
**iterations** | **Integer** | Total number of iteration performed to obtain the current result | [optional] 
**total_distance** | **Integer** | cumulated distance of every route (in m) | [optional] 
**total_time** | **Integer** | Cumulated time of every route (in s) | [optional] 
**total_travel_time** | **Integer** | Cumulated travel time of every route (in s) | [optional] 
**total_waiting_time** | **Integer** | Cumulated idle time of every route (in s) | [optional] 
**routes** | [**Array&lt;ApiV01VrpResultSolutionRoute&gt;**](ApiV01VrpResultSolutionRoute.md) | All the route calculated | [optional] 
**unassigned** | [**Array&lt;ApiV01VrpResultSolutionUnassigned&gt;**](ApiV01VrpResultSolutionUnassigned.md) | Jobs which are not part of the solution | [optional] 
**elapsed** | **Integer** | Elapsed time within solver in ms | [optional] 


