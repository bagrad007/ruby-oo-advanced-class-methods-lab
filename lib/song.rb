require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    @@all.detect {|song| name == song.name ? song : false}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end  

  def self.alphabetical
      # binding.pry    
    sorted_array = @@all.collect {|song| song.name}.sort
    sorted_array.collect {|name| self.find_by_name(name)}
  end

  def self.new_from_filename(file_name)
    # binding.pry
    file_name_array = file_name.split(".mp3")[0].split(" - ")
    song_name = file_name_array[1]
    artist_name = file_name_array[0]
    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def self.destroy_all
    @@all.clear
  end
end
