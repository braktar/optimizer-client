# OptimizerClient::Post01VrpSubmitVrpConfigurationSchedule

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**range_indices** | [**Post01VrpSubmitVrpConfigurationScheduleRangeIndices**](Post01VrpSubmitVrpConfigurationScheduleRangeIndices.md) |  | [optional] 
**range_date** | [**Post01VrpSubmitVrpConfigurationScheduleRangeDate**](Post01VrpSubmitVrpConfigurationScheduleRangeDate.md) |  | [optional] 
**unavailable_indices** | **Array&lt;Integer&gt;** | (Scheduling only) Exclude some days indices from the resolution | [optional] 
**unavailable_date** | **Array&lt;Date&gt;** | (Scheduling only) Exclude some days from the resolution | [optional] 
**unavailable_index_ranges** | [**Array&lt;Post01VrpSubmitVrpUnavailableIndexRanges&gt;**](Post01VrpSubmitVrpUnavailableIndexRanges.md) | (Scheduling only) Day index ranges where no routes should be generated | [optional] 
**unavailable_date_ranges** | [**Array&lt;Post01VrpSubmitVrpUnavailableDateRanges&gt;**](Post01VrpSubmitVrpUnavailableDateRanges.md) | (Scheduling only) Date ranges where no routes should be generated | [optional] 


