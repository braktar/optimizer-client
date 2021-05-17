# OptimizerClient::ApiV01VrpResultSolutionRouteActivityDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**router_mode** | **String** | Means of transport used to reach this activity, it may vary within a route if subtours are defined | [optional] 
**speed_multiplier** | **String** | Speed multiplier applied to the current means of transport, it may vary within a route if subtours are defined | [optional] 
**lat** | **Float** |  | [optional] 
**lon** | **Float** |  | [optional] 
**skills** | **String** |  | [optional] 
**setup_duration** | **Integer** |  | [optional] 
**duration** | **Integer** |  | [optional] 
**additional_value** | **Integer** |  | [optional] 
**quantities** | [**Array&lt;ApiV01VrpResultDetailQuantities&gt;**](ApiV01VrpResultDetailQuantities.md) |  | [optional] 
**timewindows** | [**Array&lt;ApiV01VrpResultSolutionRouteActivityDetailTimewindows&gt;**](ApiV01VrpResultSolutionRouteActivityDetailTimewindows.md) |  | [optional] 


