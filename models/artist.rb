require('pg')
require_relative('../db/sql_runner.rb')
# require_relative('albums.rb')

class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"]
    @name = options["name"]
  end
  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end
  def self.delete_all()
    sql ="DELETE FROM artists"
    SqlRunner.run(sql)
  end
  def update()
    sql ="UPDATE artists SET name = $1 WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end
  def self.all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    return result.map {|result| self.new(result)}
  end
  def delete()
    sql = "DELETE FROM artists WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end
  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1;"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map {|album_hash|  Album.new(album_hash)}
  end
  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artists = SqlRunner.run(sql, values)
    Artist.new(artists.first())
  end
end
