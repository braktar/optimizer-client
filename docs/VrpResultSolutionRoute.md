# OptimizerClient::VrpResultSolutionRoute

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**vehicle_id** | **String** | Reference of the vehicule used for the current route | [optional] 
**activities** | [**Array&lt;VrpResultSolutionRouteActivities&gt;**](VrpResultSolutionRouteActivities.md) | Every step of the route | [optional] 
**total_distance** | **Integer** | Sum of every distance within the route | [optional] 
**total_time** | **Integer** | Sum of every travel time and activity duration of the route | [optional] 
**start_time** | **Integer** | Give the actual start time of the current route if provided by the solve | [optional] 
**end_time** | **Integer** | Give the actual end time of the current route if provided by the solver | [optional] 
**geometry** | **String** | Contains the geometry of the route, if asked in first place | [optional] 
**initial_loads** | [**Array&lt;VrpResultDetailQuantities&gt;**](VrpResultDetailQuantities.md) | Give the actual initial loads of the route | [optional] 


