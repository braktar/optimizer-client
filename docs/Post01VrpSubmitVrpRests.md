# OptimizerClient::Post01VrpSubmitVrpRests

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**duration** | **Integer** | Duration of the vehicle rest | [default to 0]
**timewindows** | [**Array&lt;Post01VrpSubmitVrpTimewindows&gt;**](Post01VrpSubmitVrpTimewindows.md) | Time slot while the rest may begin | [optional] 
**late_multiplier** | **Float** | Late multiplier applied for this rest | [optional] 
**exclusion_cost** | **Float** | Cost induced by non affectation of this rest | [optional] 


