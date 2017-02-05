require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/Transaction')
require_relative('./models/Merchant')
require_relative('./models/Tag')

get '/' do
  erb(:index)
end

get '/transactions' do
  @total_expenditure = Transaction.total_spent
  @transactions = Transaction.all()
  erb(:transactions_list)
end

get '/transactions/:tag_id' do
  
end

get '/transactions/new' do
  @merchant = Merchant.all()
  @tag = Tag.all()
  erb(:new)
end
