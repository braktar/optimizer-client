# OptimizerClient::Post01VrpSubmitVrp

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Name of the problem, used as tag for all element in order to name plan when importing returned .csv file | [optional] 
**matrices** | [**Array&lt;Post01VrpSubmitVrpMatrices&gt;**](Post01VrpSubmitVrpMatrices.md) | Define all the distances between each point of problem | [optional] 
**points** | [**Array&lt;Post01VrpSubmitVrpPoints&gt;**](Post01VrpSubmitVrpPoints.md) | Particular place in the map | [optional] 
**units** | [**Array&lt;Post01VrpSubmitVrpUnits&gt;**](Post01VrpSubmitVrpUnits.md) | The name of a Capacity/Quantity | [optional] 
**rests** | [**Array&lt;Post01VrpSubmitVrpRests&gt;**](Post01VrpSubmitVrpRests.md) | Break within a vehicle tour | [optional] 
**zones** | [**Array&lt;Post01VrpSubmitVrpZones&gt;**](Post01VrpSubmitVrpZones.md) |  | [optional] 
**vehicles** | [**Array&lt;Post01VrpSubmitVrpVehicles&gt;**](Post01VrpSubmitVrpVehicles.md) | Set of available vehicles | 
**services** | [**Array&lt;Post01VrpSubmitVrpServices&gt;**](Post01VrpSubmitVrpServices.md) | Independent activity, which does not require a context | [optional] 
**shipments** | [**Array&lt;Post01VrpSubmitVrpShipments&gt;**](Post01VrpSubmitVrpShipments.md) | Link directly one activity of collection to another of drop off. Not available with periodic heuristic. | [optional] 
**relations** | [**Array&lt;Post01VrpSubmitVrpRelations&gt;**](Post01VrpSubmitVrpRelations.md) | Not available with periodic heuristic | [optional] 
**subtours** | [**Array&lt;Post01VrpSubmitVrpSubtours&gt;**](Post01VrpSubmitVrpSubtours.md) | Not available with periodic heuristic | [optional] 
**routes** | [**Array&lt;Post01VrpSubmitVrpRoutes&gt;**](Post01VrpSubmitVrpRoutes.md) |  | [optional] 
**configuration** | [**Post01VrpSubmitVrpConfiguration**](Post01VrpSubmitVrpConfiguration.md) |  | [optional] 


