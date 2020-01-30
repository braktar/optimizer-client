# OptimizerClient::Post01VrpSubmitVrpActivity

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**duration** | **String** | Time while the current activity stands until it&#39;s over (in seconds) | [optional] 
**additional_value** | **Integer** | Additional value associated to the visit | [optional] 
**setup_duration** | **String** | Time at destination before the proper activity is effectively performed | [optional] 
**late_multiplier** | **Float** | Overrides the late_multiplier defined at the vehicle level (ORtools only) | [optional] 
**timewindow_start_day_shift_number** | **Integer** | [ DEPRECATED ] | [optional] 
**point_id** | **String** | Reference to the associated point | 
**timewindows** | [**Array&lt;Post01VrpSubmitVrpTimewindows&gt;**](Post01VrpSubmitVrpTimewindows.md) |  | [optional] 


