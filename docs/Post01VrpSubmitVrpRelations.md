# OptimizerClient::Post01VrpSubmitVrpRelations

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | Relations allow to define constraints explicitly between activities and/or vehicles.                            It could be the following types: same_route, sequence, order, minimum_day_lapse, maximum_day_lapse,                            shipment, meetup, minimum_duration_lapse, maximum_duration_lapse | 
**lapse** | **Integer** | Only used for relations implying a duration constraint : minimum/maximum day lapse, vehicle group durations... | [optional] 
**linked_ids** | **Array&lt;String&gt;** | List of activities involved in the relation | [optional] 
**linked_vehicle_ids** | **Array&lt;String&gt;** | List of vehicles involved in the relation | [optional] 


