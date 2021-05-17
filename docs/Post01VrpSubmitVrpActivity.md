# OptimizerClient::Post01VrpSubmitVrpActivity

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**position** | **String** | Provides an indication on when to do this service among whole route | [optional] [default to &#39;neutral&#39;]
**duration** | **Integer** | Time while the current activity stands until it&#39;s over (in seconds) | [optional] [default to 0]
**additional_value** | **Integer** | Additional value associated to the visit | [optional] 
**setup_duration** | **Integer** | Time at destination before the proper activity is effectively performed | [optional] [default to 0]
**late_multiplier** | **Float** | (ORtools only) Overrides the late_multiplier defined at the vehicle level | [optional] 
**point_id** | **String** | Reference to the associated point | 
**timewindows** | [**Array&lt;Post01VrpSubmitVrpTimewindows&gt;**](Post01VrpSubmitVrpTimewindows.md) | Time slot while the activity may start | [optional] 


