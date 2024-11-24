class AuthController
    def self.login(params)
      user = User.find_by_email(params[:email])
      if user && BCrypt::Password.new(user.password_hash) == params[:password]
        { message: 'Login successful', user: { id: user.id.to_s, name: user.name, email: user.email } }
      else
        { error: 'Invalid email or password' }
      end
    end
  end
  