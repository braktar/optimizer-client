# OptimizerClient::ApiV01VrpResultSolutionRoute

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**vehicle_id** | **String** | Internal reference of the vehicule used for the current route | [optional] 
**activities** | [**Array&lt;ApiV01VrpResultSolutionRouteActivities&gt;**](ApiV01VrpResultSolutionRouteActivities.md) | Every step of the route | [optional] 
**total_travel_time** | **Integer** | Sum of every travel time within the route (in s) | [optional] 
**total_distance** | **Integer** | Sum of every distance within the route (in m) | [optional] 
**total_time** | **Integer** | Sum of every travel time and activity duration of the route (in s) | [optional] 
**total_waiting_time** | **Integer** | Sum of every idle time within the route (in s) | [optional] 
**start_time** | **Integer** | Give the actual start time of the current route if provided by the solve | [optional] 
**end_time** | **Integer** | Give the actual end time of the current route if provided by the solver | [optional] 
**geometry** | **String** | Contains the geometry of the route, if asked in first place | [optional] 
**initial_loads** | [**Array&lt;ApiV01VrpResultDetailQuantities&gt;**](ApiV01VrpResultDetailQuantities.md) | Give the actual initial loads of the route | [optional] 
**cost_details** | [**ApiV01VRPResultDetailedCosts**](ApiV01VRPResultDetailedCosts.md) | The impact of the current route within the solution cost | [optional] 


