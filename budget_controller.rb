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

get '/transactions/tag/:tag_id' do
  tag = Tag.find(params[:tag_id].to_i)
  @total_expenditure = Transaction.total_spent_on(tag)
  @transactions = Transaction.find_by_tag_id(tag.id)
  erb(:transactions_list)
end

get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:new)
end

post '/transactions/new' do
  transaction_data = {'merchant_id' => params[:merchant_id], 'tag_id' => params[:tag_id], 'value' => params[:value]}
  transaction = Transaction.new(transaction_data)
  transaction.save
  redirect to('/transactions/created')
end

get '/transactions/created' do
  erb(:created)
end

