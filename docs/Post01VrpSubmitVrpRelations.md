# OptimizerClient::Post01VrpSubmitVrpRelations

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**type** | **String** | Relations allow to define constraints explicitly between activities and/or vehicles. It could be the following types: same_route, sequence, order, minimum_day_lapse, maximum_day_lapse, shipment, meetup, maximum_duration_lapse, force_first, never_first, force_end, vehicle_group_duration, vehicle_group_duration_on_weeks or vehicle_group_duration_on_months | 
**lapse** | **Integer** | Only used for relations implying a duration constraint : minimum/maximum day lapse, vehicle group durations... | [optional] 
**linked_ids** | **String** | List of activities involved in the relation | [optional] 
**linked_vehicle_ids** | **String** | List of vehicles involved in the relation | [optional] 
**periodicity** | **Integer** | In the case of planning optimization, number of weeks/months to consider at the same time/in each relation : vehicle group duration on weeks/months | [optional] 


