require './app/config/environment'
require 'logger'

logger = Logger.new($stdout) # create a new logger that writes to the console

logger.info('Starting application...')

# Routes for Authentication
post '/auth/login' do
  params = JSON.parse(request.body.read)
  result = AuthController.login(params)
  result.to_json
end

# Routes for Users CRUD
post '/users' do
  params = JSON.parse(request.body.read)
  result = UsersController.create(params)
  result.to_json
end

get '/users' do
  UsersController.read_all.to_json
end

get '/users/:id' do
  UsersController.read_one(params[:id]).to_json
end

put '/users/:id' do
  params = JSON.parse(request.body.read)
  result = UsersController.update(params[:id], params)
  result.to_json
end

delete '/users/:id' do
  result = UsersController.delete(params[:id])
  result.to_json
end
