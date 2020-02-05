# OptimizerClient::VrpResultSolution

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**heuristics_synthesis** | **Object** | When first_solution_strategies are provided, sum up of tryied heuristics and their performance. | [optional] 
**solvers** | **String** | Solvers used to perform the optimization | [optional] 
**cost** | **Float** | The actual cost of the solution considering all costs | [optional] 
**iterations** | **Integer** | Total number of iteration performed to obtain the current result | [optional] 
**total_distance** | **Integer** | cumulated distance of every route | [optional] 
**total_time** | **Integer** | Cumulated time of every route | [optional] 
**start_time** | **Integer** |  | [optional] 
**end_time** | **Integer** |  | [optional] 
**routes** | [**Array&lt;VrpResultSolutionRoute&gt;**](VrpResultSolutionRoute.md) | All the route calculated | [optional] 
**unassigned** | [**Array&lt;VrpResultSolutionUnassigneds&gt;**](VrpResultSolutionUnassigneds.md) | Jobs which are not part of the solution | [optional] 


