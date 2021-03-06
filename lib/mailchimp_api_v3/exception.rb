module Mailchimp
  module Exception
    def self.parse_invalid_resource_exception(data)
      detail = data['detail']

      if detail.include? 'already'
        fail Duplicate, data
      elsif detail.include? 'can\'t be blank'
        fail MissingField, data
      else
        fail BadRequest, data
      end
    end

    class DataException < RuntimeError
      def initialize(data)
        @data = data
        super detail
      end

      def method_missing(symbol)
        @data[symbol.id2name]
      end
    end

    APIKeyError = Class.new(DataException)
    NotFound = Class.new(DataException)
    Duplicate = Class.new(DataException)
    MissingField = Class.new(DataException)
    BadRequest = Class.new(DataException)

    UnknownAttribute = Class.new(RuntimeError)
    MissingId = Class.new(RuntimeError)

    MAPPED_EXCEPTIONS = {
      'RestClient::ResourceNotFound' => NotFound,
      'RestClient::Unauthorized' => APIKeyError
    }
  end
end
