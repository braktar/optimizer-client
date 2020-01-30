# OptimizerClient::VrpResultJob

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Job uniq ID | [optional] 
**status** | **String** | One of queued, working, completed, killed or failed. | [optional] 
**avancement** | **String** | Free form advancement message. | [optional] 
**graph** | [**Array&lt;VrpResultJobGraphItem&gt;**](VrpResultJobGraphItem.md) | Items to plot cost evolution. | [optional] 


