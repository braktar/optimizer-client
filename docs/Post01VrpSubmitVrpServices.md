# OptimizerClient::Post01VrpSubmitVrpServices

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**priority** | **Integer** | Priority assigned to the service in case of conflict to assign every jobs (from 0 to 8, default is 4. 0 is the highest priority level). Not available with same_point_day option. | [optional] 
**exclusion_cost** | **Integer** | Exclusion cost. Not available with periodic heuristic. | [optional] 
**visits_number** | **Integer** | Total number of visits over the complete schedule (including the unavailable visit indices) | [optional] [default to 1]
**unavailable_visit_indices** | **Array&lt;Integer&gt;** | [planning] unavailable indices of visit | [optional] 
**unavailable_visit_day_indices** | **Array&lt;Integer&gt;** | [planning] Express the exceptionnals days indices of unavailabilty | [optional] 
**unavailable_visit_day_date** | **Array&lt;String&gt;** | [planning] Express the exceptionnals days of unavailability | [optional] 
**minimum_lapse** | **Float** | Minimum day lapse between two visits | [optional] 
**maximum_lapse** | **Float** | Maximum day lapse between two visits | [optional] 
**sticky_vehicle_ids** | **Array&lt;String&gt;** | Defined to which vehicle the service is assigned | [optional] 
**skills** | **Array&lt;String&gt;** | Particular abilities required by a vehicle to perform this service | [optional] 
**type** | **String** | service, pickup or delivery | [optional] 
**activity** | [**Post01VrpSubmitVrpActivity**](Post01VrpSubmitVrpActivity.md) |  | [optional] 
**activities** | [**Array&lt;Post01VrpSubmitVrpActivities&gt;**](Post01VrpSubmitVrpActivities.md) | Define other possible activities for the service. This allows to assign different timewindows and/or points to a single service. | [optional] 
**quantities** | [**Array&lt;Post01VrpSubmitVrpQuantities&gt;**](Post01VrpSubmitVrpQuantities.md) | Define the entities which are taken or dropped | [optional] 


