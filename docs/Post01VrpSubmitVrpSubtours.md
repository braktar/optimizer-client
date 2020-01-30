# OptimizerClient::Post01VrpSubmitVrpSubtours

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**time_bounds** | **Integer** | Time limit from the transmodal points (Isochrone) | [optional] 
**distance_bounds** | **Integer** | Distance limit from the transmodal points (Isodistanche) | [optional] 
**router_mode** | **String** | car, truck, bicycle...etc. See the Router Wrapper API doc | [optional] 
**router_dimension** | **String** | time or dimension, choose between a matrix based on minimal route duration or on minimal route distance | [optional] 
**speed_multiplier** | **Float** | multiply the current modality speed, default : 1.0 | [optional] 
**skills** | **String** | Particular abilities required by a vehicle to perform this subtour | [optional] 
**duration** | **Integer** | Maximum subtour duration | [optional] 
**transmodal_stops** | [**Array&lt;Post01VrpSubmitVrpPoints&gt;**](Post01VrpSubmitVrpPoints.md) |  | [optional] 
**capacities** | [**Array&lt;Post01VrpSubmitVrpCapacities&gt;**](Post01VrpSubmitVrpCapacities.md) |  | [optional] 


