require 'sinatra'
require 'mongo'
require 'json'
require 'bcrypt'
require_relative '../db/mongo_client'
require_relative '../models/user'
require_relative '../controllers/auth_controller'
require_relative '../controllers/users_controller'

# Environment setup
set :bind, '0.0.0.0'
set :port, 4567
