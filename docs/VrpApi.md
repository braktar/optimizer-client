# OptimizerClient::VrpApi

All URIs are relative to *https://optimizer.mapotempo.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_job**](VrpApi.md#delete_job) | **DELETE** /0.1/vrp/jobs/{id} | Delete vrp job
[**job**](VrpApi.md#job) | **GET** /0.1/vrp/jobs/{id} | Fetch vrp job status
[**list_jobs**](VrpApi.md#list_jobs) | **GET** /0.1/vrp/jobs | List vrp jobs
[**vrp**](VrpApi.md#vrp) | **POST** /0.1/vrp/submit | Submit VRP problem


# **delete_job**
> delete_job(id)

Delete vrp job

Kill the job. This operation may have delay, since if the job is working it will be killed during the next iteration.

### Example
```ruby
# load the gem
require 'optimizer-client'

api_instance = OptimizerClient::VrpApi.new

id = 'id_example' # String | Job id returned by creating VRP problem.


begin
  #Delete vrp job
  api_instance.delete_job(id)
rescue OptimizerClient::ApiError => e
  puts "Exception when calling VrpApi->delete_job: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Job id returned by creating VRP problem. | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=UTF-8, application/xml



# **job**
> VrpResult job(id)

Fetch vrp job status

Get the job status and details, contains progress avancement. Return the best actual solutions currently found.

### Example
```ruby
# load the gem
require 'optimizer-client'

api_instance = OptimizerClient::VrpApi.new

id = 'id_example' # String | Job id returned by creating VRP problem.


begin
  #Fetch vrp job status
  result = api_instance.job(id)
  p result
rescue OptimizerClient::ApiError => e
  puts "Exception when calling VrpApi->job: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Job id returned by creating VRP problem. | 

### Return type

[**VrpResult**](VrpResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=UTF-8, application/xml



# **list_jobs**
> VrpJobsList list_jobs

List vrp jobs

List running or queued jobs.

### Example
```ruby
# load the gem
require 'optimizer-client'

api_instance = OptimizerClient::VrpApi.new

begin
  #List vrp jobs
  result = api_instance.list_jobs
  p result
rescue OptimizerClient::ApiError => e
  puts "Exception when calling VrpApi->list_jobs: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**VrpJobsList**](VrpJobsList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=UTF-8, application/xml



# **vrp**
> VrpResult vrp(_01_vrp_submit)

Submit VRP problem

Submit vehicle routing problem. If the problem can be quickly solved, the solution is returned in the response. In other case, the response provides a job identifier in a queue: you need to perfom another request to fetch vrp job status and solution.

### Example
```ruby
# load the gem
require 'optimizer-client'

api_instance = OptimizerClient::VrpApi.new

_01_vrp_submit = OptimizerClient::Post01VrpSubmit.new # Post01VrpSubmit | 


begin
  #Submit VRP problem
  result = api_instance.vrp(_01_vrp_submit)
  p result
rescue OptimizerClient::ApiError => e
  puts "Exception when calling VrpApi->vrp: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **_01_vrp_submit** | [**Post01VrpSubmit**](Post01VrpSubmit.md)|  | 

### Return type

[**VrpResult**](VrpResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=UTF-8, application/xml



