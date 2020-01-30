# OptimizerClient::Post01VrpSubmitVrpConfigurationPreprocessingPartitions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**method** | **String** | Method used to partition | 
**metric** | **String** | Defines partition reference metric. Values should be either duration, visits or any unit you defined in units. | [optional] 
**entity** | **String** | Describes what the partition corresponds to. Only available if method in [balanced_kmeans hierarchical_tree] | [optional] 
**threshold** | **Integer** | Maximum size of partition. Only available if method in [iterative_kmean clique] | [optional] 


