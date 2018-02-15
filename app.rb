require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:main.sqlite3"
set :sessions, true

require './models'

# partial ruby files
require './ruby/user/delete_confirm'
require './ruby/user/profile'
require './ruby/user/settings'
require './ruby/user/signup'

require './ruby/landing'
require './ruby/layout'
require './ruby/recent_blogs'
require './ruby/recent_people'
