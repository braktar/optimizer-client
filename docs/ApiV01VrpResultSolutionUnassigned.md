# OptimizerClient::ApiV01VrpResultSolutionUnassigned

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**point_id** | **String** | Linked spatial point | [optional] 
**service_id** | **String** | Internal reference of the service | [optional] 
**pickup_shipment_id** | **String** | Internal reference of the shipment | [optional] 
**delivery_shipment_id** | **String** | Internal reference of the shipment | [optional] 
**rest_id** | **String** | Internal reference of the rest | [optional] 
**detail** | [**ApiV01VrpResultSolutionRouteActivityDetails**](ApiV01VrpResultSolutionRouteActivityDetails.md) |  | [optional] 
**type** | **String** | depot, rest, service, pickup or delivery | [optional] 
**reason** | **String** | Unassigned reason. Only available when activity was rejected within preprocessing fase or periodic first_solution_strategy. | [optional] 


