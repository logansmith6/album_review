require 'bundler'

Bundler.require
configure :development do
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite3"
)
end
require_all 'app'
