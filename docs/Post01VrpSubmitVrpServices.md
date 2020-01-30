# OptimizerClient::Post01VrpSubmitVrpServices

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**priority** | **Integer** | Priority assigned to the service in case of conflict to assign every jobs (from 0 to 8, default is 4. 0 is the highest priority level). Not available with same_point_day option. | [optional] 
**exclusion_cost** | **Integer** | Exclusion cost. Not available with periodic heuristic. | [optional] 
**visits_number** | **Integer** | Total number of visits over the complete schedule (including the unavailable visit indices) | [optional] 
**unavailable_visit_indices** | **Integer** | [planning] unavailable indices of visit | [optional] 
**unavailable_visit_day_indices** | **Integer** | [planning] Express the exceptionnals days indices of unavailabilty | [optional] 
**minimum_lapse** | **Float** | Minimum day lapse between two visits | [optional] 
**maximum_lapse** | **Float** | Maximum day lapse between two visits | [optional] 
**sticky_vehicle_ids** | **String** | Defined to which vehicle the service is assigned | [optional] 
**skills** | **String** | Particular abilities required by a vehicle to perform this service | [optional] 
**type** | **String** | service, pickup or delivery | [optional] 
**activity** | [**Array&lt;Post01VrpSubmitVrpActivity&gt;**](Post01VrpSubmitVrpActivity.md) |  | [optional] 
**activities** | [**Array&lt;Post01VrpSubmitVrpActivity&gt;**](Post01VrpSubmitVrpActivity.md) |  | [optional] 
**quantities** | [**Array&lt;Post01VrpSubmitVrpQuantities&gt;**](Post01VrpSubmitVrpQuantities.md) |  | [optional] 


