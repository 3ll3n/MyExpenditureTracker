require_relative("../db/sql_runner")

class Transaction

  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :value

  def initialize(transaction_data)
    @id = transaction_data['id'].to_i
    @merchant_id = transaction_data['merchant_id'].to_i
    @tag_id = transaction_data['tag_id'].to_i
    @value = transaction_data['value'].to_f
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, value) VALUES (#{@merchant_id}, #{@tag_id}, #{@value}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i 
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    result = SqlRunner.run(sql)
    transactions = result.map{ |transaction_data| Transaction.new(transaction_data) }
    return transactions
  end

  def self.total_spent()
    sql = "SELECT SUM(value) total_spent FROM transactions"
    result = SqlRunner.run(sql)
    return result.first['total_spent'].to_f
  end

  def self.total_spent_on(tag)
    sql = "SELECT SUM(value) total_spent FROM transactions WHERE tag_id = #{tag};"
    result = SqlRunner.run(sql)
    return result.first['total_spent'].to_f
  end

  def merchant()
    # get the merchant info back based on the merchant_id
    sql = "SELECT * FROM merchants WHERE id = #{merchant_id}"
    result = SqlRunner.run(sql)
    return result.map{ |merchant| Merchant.new(merchant)}
  end

  # def tag()
  # end

  # def self.find(id)
  #   sql = "SELECT * FROM transactions WHERE id =#{id}"
  #   result = SqlRunner.run(sql)
  #   transaction = Transaction.new(transaction.first)
  #   return transaction
  # end

  def self.find_by_tag_id(id)
    sql = "SELECT * FROM transactions WHERE tag_id = #{id};"
    result = SqlRunner.run(sql)
    transactions = result.map{ |transaction_data| Transaction.new(transaction_data)}
    return transactions
  end

  def self.delete(id)
    sql = "DELETE FROM transactions WHERE id = #{id}"
    result = SqlRunner.run(sql)
    return result
  end

end
