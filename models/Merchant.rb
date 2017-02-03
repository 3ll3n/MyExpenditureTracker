require_relative("../db/sql_runner")

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(merchant_data)
    @id = merchant_data['id'].to_i
    @name = merchant_data['name']
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM merchants"
    result = SqlRunner.run(sql)
    merchants = result.map{ |merchant_data| Merchant.new(merchant_data) }
    return merchants
  end

end