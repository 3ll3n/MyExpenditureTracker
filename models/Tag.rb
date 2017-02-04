require_relative("../db/sql_runner")

class Tag

  attr_reader :id
  attr_accessor :category

  def initialize(tag_data)
    @id = tag_data['id'].to_i
    @category = tag_data['category']
  end

  def save()
    sql = "INSERT INTO tags (category) VALUES ('#{@category}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags"
    result = SqlRunner.run(sql)
    tags = result.map{ |tag_data| Tag.new(tag_data)}
    return tags
  end

end