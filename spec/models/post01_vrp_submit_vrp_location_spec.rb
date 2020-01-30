=begin
#Optimizers API

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 0.1.0
Contact: tech@mapotempo.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.12

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for OptimizerClient::Post01VrpSubmitVrpLocation
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'Post01VrpSubmitVrpLocation' do
  before do
    # run before each test
    @instance = OptimizerClient::Post01VrpSubmitVrpLocation.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of Post01VrpSubmitVrpLocation' do
    it 'should create an instance of Post01VrpSubmitVrpLocation' do
      expect(@instance).to be_instance_of(OptimizerClient::Post01VrpSubmitVrpLocation)
    end
  end
  describe 'test attribute "lat"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "lon"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
