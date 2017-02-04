require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/Transaction')

get '/transactions' do
  @transactions = Transaction.all()
  erb(:index)
end