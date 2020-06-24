require_relative "./COVIDTracker/version"
require_relative './api_manager'
require_relative './cli'
require_relative './cases'

require 'pry'
require 'httparty'

module COVIDTracker
  class Error < StandardError; end
  # Your code goes here...
end
