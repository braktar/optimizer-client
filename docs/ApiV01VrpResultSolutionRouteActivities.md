# OptimizerClient::ApiV01VrpResultSolutionRouteActivities

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**day_week_num** | **String** |  | [optional] 
**day_week** | **String** |  | [optional] 
**point_id** | **String** | Linked spatial point | [optional] 
**travel_distance** | **Integer** | Travel distance from previous point (in m) | [optional] 
**travel_time** | **Integer** | Travel time from previous point (in s) | [optional] 
**travel_value** | **Integer** | Travel value from previous point | [optional] 
**waiting_time** | **Integer** | Idle time (in s) | [optional] 
**begin_time** | **Integer** | Time visit starts | [optional] 
**end_time** | **Integer** | Time visit ends | [optional] 
**departure_time** | **Integer** |  | [optional] 
**service_id** | **String** | Internal reference of the service | [optional] 
**pickup_shipment_id** | **String** | Internal reference of the shipment | [optional] 
**delivery_shipment_id** | **String** | Internal reference of the shipment | [optional] 
**rest_id** | **String** | Internal reference of the rest | [optional] 
**detail** | [**ApiV01VrpResultSolutionRouteActivityDetails**](ApiV01VrpResultSolutionRouteActivityDetails.md) |  | [optional] 
**type** | **String** | depot, rest, service, pickup or delivery | [optional] 
**current_distance** | **Integer** | Travel distance from route start to current point (in m) | [optional] 
**alternative** | **Integer** | When one service has alternative activities, index of the chosen one | [optional] 


