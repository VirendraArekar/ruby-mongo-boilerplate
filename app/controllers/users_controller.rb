class UsersController
    def self.create(params)
      hashed_password = BCrypt::Password.create(params[:password])
      user = User.new(name: params[:name], email: params[:email], password_hash: hashed_password)
      user.save
      { message: 'User created successfully', user: { id: user.id.to_s, name: user.name, email: user.email } }
    end
  
    def self.read_all
      users = User.all.map { |user| { id: user.id.to_s, name: user.name, email: user.email } }
      { users: users }
    end
  
    def self.read_one(id)
      user = User.find_by_id(id)
      user ? { user: { id: user.id.to_s, name: user.name, email: user.email } } : { error: 'User not found' }
    end
  
    def self.update(id, params)
      result = User.update(id, params)
      result.n > 0 ? { message: 'User updated successfully' } : { error: 'Update failed' }
    end
  
    def self.delete(id)
      result = User.delete(id)
      result.n > 0 ? { message: 'User deleted successfully' } : { error: 'Delete failed' }
    end
  end
  