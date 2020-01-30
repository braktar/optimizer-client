# OptimizerClient::Post01VrpSubmitVrpQuantities

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**unit_id** | **String** | Unit related to this quantity | 
**fill** | **BOOLEAN** | Allows to fill with quantity, until this unit vehicle capacity is full | [optional] 
**empty** | **BOOLEAN** | Allows to empty this quantity, until this unit vehicle capacity reaches zero | [optional] 
**value** | **Float** | Value of current quantity | [optional] 
**setup_value** | **Integer** | If the associated unit is a counting one, defines the default value to count for this stop (additional quantities for this specific service are to define with the value tag) | [optional] 


