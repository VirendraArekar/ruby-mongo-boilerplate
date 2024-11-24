require 'mongo'

class MongoClient
  def self.client
    @client ||= Mongo::Client.new(['127.0.0.1:27017'], database: 'ruby_app_db')
  end
end
