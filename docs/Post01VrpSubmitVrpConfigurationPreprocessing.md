# OptimizerClient::Post01VrpSubmitVrpConfigurationPreprocessing

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**max_split_size** | **Integer** | Divide the problem into clusters beyond this threshold | [optional] 
**partition_method** | **String** | [ DEPRECATED : use partitions structure instead ] | [optional] 
**partition_metric** | **String** | [ DEPRECATED : use partitions structure instead ] | [optional] 
**kmeans_centroids** | **Array&lt;Integer&gt;** | Forces centroid indices used to generate clusters with kmeans partition_method. Only available with deprecated partition_method | [optional] 
**cluster_threshold** | **Float** | Regroup close points which constitute a cluster into a single geolocated point | [optional] 
**force_cluster** | **BOOLEAN** | Force to cluster visits even if containing timewindows and quantities | [optional] 
**prefer_short_segment** | **BOOLEAN** | Could allow to pass multiple time in the same street but deliver in a single row | [optional] 
**neighbourhood_size** | **Integer** | Limit the size of the considered neighbourhood within the search | [optional] 
**first_solution_strategy** | **Array&lt;String&gt;** | Forces first solution strategy. Either one value to force specific behavior, or a list in order to test several ones and select the best. If string is &#39;internal&#39;, we will choose among pre-selected behaviors. There can not be more than three behaviors (ORtools only) | [optional] 
**partitions** | [**Array&lt;Post01VrpSubmitVrpConfigurationPreprocessingPartitions&gt;**](Post01VrpSubmitVrpConfigurationPreprocessingPartitions.md) |  | [optional] 


