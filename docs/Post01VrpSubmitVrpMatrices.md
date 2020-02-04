# OptimizerClient::Post01VrpSubmitVrpMatrices

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**time** | **Array&lt;Float&gt;** | Matrix of time, travel duration between each pair of point in the problem. It must be send as an Array[Array[Float]] as it could potentially be non squared matrix | [optional] 
**distance** | **Array&lt;Float&gt;** | Matrix of distance, travel distance between each pair of point in the problem. It must be send as an Array[Array[Float]] as it could potentially be non squared matrix | [optional] 
**value** | **Array&lt;Float&gt;** | Matrix of values, travel value between each pair of point in the problem if not distance or time related. It must be send as an Array[Array[Float]] as it could potentially be non squared matrix | [optional] 


