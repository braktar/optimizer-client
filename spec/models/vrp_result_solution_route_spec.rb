=begin
#Optimizers API

# Unified API for multiple optimizer engines dedicated to Vehicle Routing Problems  Its purpose is to provide a complete chain for the resolution. From a provided VRP, it requires a distance matrix, solve the problem and prepare a self sufficient result.  Please check the Github Wiki for more details: [https://github.com/Mapotempo/optimizer-api/wiki](https://github.com/Mapotempo/optimizer-api/wiki) 

OpenAPI spec version: 0.1.5
Contact: tech@mapotempo.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.12

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for OptimizerClient::VrpResultSolutionRoute
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'VrpResultSolutionRoute' do
  before do
    # run before each test
    @instance = OptimizerClient::VrpResultSolutionRoute.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of VrpResultSolutionRoute' do
    it 'should create an instance of VrpResultSolutionRoute' do
      expect(@instance).to be_instance_of(OptimizerClient::VrpResultSolutionRoute)
    end
  end
  describe 'test attribute "vehicle_id"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "activities"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "total_distance"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "total_time"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "start_time"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "end_time"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "geometry"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "initial_loads"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
