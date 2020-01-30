# OptimizerClient::Post01VrpSubmitVrpShipments

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**priority** | **Integer** | Priority assigned to the service in case of conflict to assign every jobs (from 0 to 8, default is 4) | [optional] 
**exclusion_cost** | **Integer** | Exclusion cost | [optional] 
**visits_number** | **Integer** | Total number of visits over the complete schedule (including the unavailable visit indices) | [optional] 
**unavailable_visit_indices** | **Integer** | [planning] unavailable indices of visit | [optional] 
**unavailable_visit_day_indices** | **Integer** | [planning] Express the exceptionnals days indices of unavailabilty | [optional] 
**minimum_lapse** | **Float** | Minimum day lapse between two visits | [optional] 
**maximum_lapse** | **Float** | Maximum day lapse between two visits | [optional] 
**maximum_inroute_duration** | **Integer** | Maximum in route duration of this particular shipment (Must be feasible !) | [optional] 
**sticky_vehicle_ids** | **String** | Defined to which vehicle the shipment is assigned | [optional] 
**skills** | **String** | Particular abilities required by a vehicle to perform this shipment | [optional] 
**pickup** | [**Array&lt;Post01VrpSubmitVrpActivity&gt;**](Post01VrpSubmitVrpActivity.md) |  | [optional] 
**delivery** | [**Array&lt;Post01VrpSubmitVrpActivity&gt;**](Post01VrpSubmitVrpActivity.md) |  | [optional] 
**quantities** | [**Array&lt;Post01VrpSubmitVrpQuantities&gt;**](Post01VrpSubmitVrpQuantities.md) |  | [optional] 


