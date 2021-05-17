# OptimizerClient::Post01VrpSubmitVrpShipments

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**priority** | **Integer** | Priority assigned to the service in case of conflict to assign every jobs (from 0 to 8, default is 4) | [optional] 
**exclusion_cost** | **Integer** | Exclusion cost | [optional] 
**visits_number** | **Integer** | Total number of visits over the complete schedule (including the unavailable visit indices) | [optional] [default to 1]
**unavailable_visit_indices** | **Array&lt;Integer&gt;** | (Scheduling only) unavailable indices of visit | [optional] 
**unavailable_visit_day_indices** | **Array&lt;Integer&gt;** | (Scheduling only) Express the exceptionnals days indices of unavailabilty | [optional] 
**unavailable_visit_day_date** | **Array&lt;String&gt;** | (Scheduling only) Express the exceptionnals days of unavailability | [optional] 
**minimum_lapse** | **Float** | Minimum day lapse between two visits | [optional] 
**maximum_lapse** | **Float** | Maximum day lapse between two visits | [optional] 
**maximum_inroute_duration** | **Integer** | Maximum in route duration of this particular shipment (Must be feasible !) | [optional] 
**sticky_vehicle_ids** | **Array&lt;String&gt;** | Defined to which vehicle the shipment is assigned | [optional] 
**skills** | **Array&lt;String&gt;** | Particular abilities required by a vehicle to perform this shipment | [optional] 
**pickup** | [**Post01VrpSubmitVrpPickup**](Post01VrpSubmitVrpPickup.md) |  | 
**delivery** | [**Post01VrpSubmitVrpDelivery**](Post01VrpSubmitVrpDelivery.md) |  | 
**direct** | **BOOLEAN** | When activated, vehicle should go directly to delivery point after pick up | [optional] 
**quantities** | [**Array&lt;Post01VrpSubmitVrpQuantities&gt;**](Post01VrpSubmitVrpQuantities.md) | Define the entities which are taken and dropped. The maximum precision supported is 1e-3. | [optional] 
**unavailable_index_ranges** | [**Array&lt;Post01VrpSubmitVrpUnavailableIndexRanges&gt;**](Post01VrpSubmitVrpUnavailableIndexRanges.md) | (Scheduling only) Day index ranges where visits can not take place | [optional] 
**unavailable_date_ranges** | [**Array&lt;Post01VrpSubmitVrpUnavailableDateRanges&gt;**](Post01VrpSubmitVrpUnavailableDateRanges.md) | (Scheduling only) Date ranges where visits can not take place | [optional] 


