# optimizer-client

OptimizerClient - the Ruby gem for the Optimizers API

No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 0.1.0
- Package version: 1.0.0
- Build package: io.swagger.codegen.languages.RubyClientCodegen
For more information, please visit [https://github.com/Mapotempo/optimizer-api](https://github.com/Mapotempo/optimizer-api)

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build optimizer-client.gemspec
```

Then either install the gem locally:

```shell
gem install ./optimizer-client-1.0.0.gem
```
(for development, run `gem install --dev ./optimizer-client-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'optimizer-client', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'optimizer-client', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
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

## Documentation for API Endpoints

All URIs are relative to *https://localhost:1791*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*OptimizerClient::VrpApi* | [**delete_job**](docs/VrpApi.md#delete_job) | **DELETE** /0.1/vrp/jobs/{id} | Delete vrp job
*OptimizerClient::VrpApi* | [**job**](docs/VrpApi.md#job) | **GET** /0.1/vrp/jobs/{id} | Fetch vrp job status
*OptimizerClient::VrpApi* | [**list_jobs**](docs/VrpApi.md#list_jobs) | **GET** /0.1/vrp/jobs | List vrp jobs
*OptimizerClient::VrpApi* | [**vrp**](docs/VrpApi.md#vrp) | **POST** /0.1/vrp/submit | Submit VRP problem


## Documentation for Models

 - [OptimizerClient::Post01VrpSubmit](docs/Post01VrpSubmit.md)
 - [OptimizerClient::Post01VrpSubmitPoints](docs/Post01VrpSubmitPoints.md)
 - [OptimizerClient::Post01VrpSubmitServices](docs/Post01VrpSubmitServices.md)
 - [OptimizerClient::Post01VrpSubmitShipments](docs/Post01VrpSubmitShipments.md)
 - [OptimizerClient::Post01VrpSubmitTimewindows](docs/Post01VrpSubmitTimewindows.md)
 - [OptimizerClient::Post01VrpSubmitVehicles](docs/Post01VrpSubmitVehicles.md)
 - [OptimizerClient::Post01VrpSubmitVrp](docs/Post01VrpSubmitVrp.md)
 - [OptimizerClient::Post01VrpSubmitVrpActivity](docs/Post01VrpSubmitVrpActivity.md)
 - [OptimizerClient::Post01VrpSubmitVrpCapacities](docs/Post01VrpSubmitVrpCapacities.md)
 - [OptimizerClient::Post01VrpSubmitVrpConfiguration](docs/Post01VrpSubmitVrpConfiguration.md)
 - [OptimizerClient::Post01VrpSubmitVrpConfigurationPreprocessing](docs/Post01VrpSubmitVrpConfigurationPreprocessing.md)
 - [OptimizerClient::Post01VrpSubmitVrpConfigurationPreprocessingPartitions](docs/Post01VrpSubmitVrpConfigurationPreprocessingPartitions.md)
 - [OptimizerClient::Post01VrpSubmitVrpConfigurationResolution](docs/Post01VrpSubmitVrpConfigurationResolution.md)
 - [OptimizerClient::Post01VrpSubmitVrpConfigurationRestitution](docs/Post01VrpSubmitVrpConfigurationRestitution.md)
 - [OptimizerClient::Post01VrpSubmitVrpConfigurationSchedule](docs/Post01VrpSubmitVrpConfigurationSchedule.md)
 - [OptimizerClient::Post01VrpSubmitVrpConfigurationScheduleRangeDate](docs/Post01VrpSubmitVrpConfigurationScheduleRangeDate.md)
 - [OptimizerClient::Post01VrpSubmitVrpConfigurationScheduleRangeIndices](docs/Post01VrpSubmitVrpConfigurationScheduleRangeIndices.md)
 - [OptimizerClient::Post01VrpSubmitVrpLocation](docs/Post01VrpSubmitVrpLocation.md)
 - [OptimizerClient::Post01VrpSubmitVrpMatrices](docs/Post01VrpSubmitVrpMatrices.md)
 - [OptimizerClient::Post01VrpSubmitVrpPoints](docs/Post01VrpSubmitVrpPoints.md)
 - [OptimizerClient::Post01VrpSubmitVrpQuantities](docs/Post01VrpSubmitVrpQuantities.md)
 - [OptimizerClient::Post01VrpSubmitVrpRelations](docs/Post01VrpSubmitVrpRelations.md)
 - [OptimizerClient::Post01VrpSubmitVrpRests](docs/Post01VrpSubmitVrpRests.md)
 - [OptimizerClient::Post01VrpSubmitVrpRoutes](docs/Post01VrpSubmitVrpRoutes.md)
 - [OptimizerClient::Post01VrpSubmitVrpServices](docs/Post01VrpSubmitVrpServices.md)
 - [OptimizerClient::Post01VrpSubmitVrpShipments](docs/Post01VrpSubmitVrpShipments.md)
 - [OptimizerClient::Post01VrpSubmitVrpSubtours](docs/Post01VrpSubmitVrpSubtours.md)
 - [OptimizerClient::Post01VrpSubmitVrpTimewindows](docs/Post01VrpSubmitVrpTimewindows.md)
 - [OptimizerClient::Post01VrpSubmitVrpUnits](docs/Post01VrpSubmitVrpUnits.md)
 - [OptimizerClient::Post01VrpSubmitVrpVehicles](docs/Post01VrpSubmitVrpVehicles.md)
 - [OptimizerClient::Post01VrpSubmitVrpZones](docs/Post01VrpSubmitVrpZones.md)
 - [OptimizerClient::Status](docs/Status.md)
 - [OptimizerClient::VrpJobsList](docs/VrpJobsList.md)
 - [OptimizerClient::VrpResult](docs/VrpResult.md)
 - [OptimizerClient::VrpResultDetailQuantities](docs/VrpResultDetailQuantities.md)
 - [OptimizerClient::VrpResultJob](docs/VrpResultJob.md)
 - [OptimizerClient::VrpResultJobGraphItem](docs/VrpResultJobGraphItem.md)
 - [OptimizerClient::VrpResultSolution](docs/VrpResultSolution.md)
 - [OptimizerClient::VrpResultSolutionRoute](docs/VrpResultSolutionRoute.md)
 - [OptimizerClient::VrpResultSolutionRouteActivities](docs/VrpResultSolutionRouteActivities.md)
 - [OptimizerClient::VrpResultSolutionRouteActivityDetailTimewindows](docs/VrpResultSolutionRouteActivityDetailTimewindows.md)
 - [OptimizerClient::VrpResultSolutionRouteActivityDetails](docs/VrpResultSolutionRouteActivityDetails.md)


## Documentation for Authorization


### api_key_header

- **Type**: API key
- **API key parameter name**: api_key
- **Location**: HTTP header

### api_key_query_param

- **Type**: API key
- **API key parameter name**: api_key
- **Location**: URL query string

