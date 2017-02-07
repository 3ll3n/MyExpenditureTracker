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
  @tags = Tag.all()
  erb(:transactions_list)
end

post '/transactions/filter' do
  @total_expenditure = Transaction.total_spent_on(params[:tag_id])
  @tags = Tag.all()
  @transactions = Transaction.find_by_tag_id(params[:tag_id])
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

get 'transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:show)
end

post 'transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to(:transactions_list)
end



