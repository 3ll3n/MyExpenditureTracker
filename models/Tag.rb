require_relative("../db/sql_runner")

class Tag

  attr_reader :id
  attr_accessor :name

  def initialize(tag_data)
    @id = tag_data['id'].to_i
    @name = tag_data['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags"
    result = SqlRunner.run(sql)
    tags = result.map{ |tag_data| Tag.new(tag_data)}
    return tags
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = #{id};"
    tag = SqlRunner.run(sql)
    result = Tag.new(tag.first)
  end

end