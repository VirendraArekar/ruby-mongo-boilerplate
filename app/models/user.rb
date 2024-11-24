class User
    include BCrypt
  
    COLLECTION = MongoClient.client[:users]
  
    attr_accessor :id, :name, :email, :password_hash
  
    def initialize(attrs = {})
      @id = attrs[:_id]
      @name = attrs[:name]
      @email = attrs[:email]
      @password_hash = attrs[:password_hash]
    end
  
    def save
      result = COLLECTION.insert_one({
        name: @name,
        email: @email,
        password_hash: @password_hash
      })
      @id = result.inserted_id
      self
    end
  
    def self.find_by_email(email)
      data = COLLECTION.find(email: email).first
      data ? User.new(data) : nil
    end
  
    def self.find_by_id(id)
      data = COLLECTION.find(_id: BSON::ObjectId(id)).first
      data ? User.new(data) : nil
    end
  
    def self.all
      COLLECTION.find.map { |data| User.new(data) }
    end
  
    def self.update(id, updates)
      COLLECTION.find(_id: BSON::ObjectId(id)).update_one('$set': updates)
    end
  
    def self.delete(id)
      COLLECTION.find(_id: BSON::ObjectId(id)).delete_one
    end
  end
  