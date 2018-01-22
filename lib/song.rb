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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.detect{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(song)
    song_mp3 = self.new
    song_mp3_split = song.split(/.-.|[.]/).reject{ |x| x == "mp3" }
    song_mp3.artist_name = song_mp3_split[0]
    song_mp3.name = song_mp3_split[1]
    song_mp3
  end

  def self.create_from_filename(song)
    song_mp3 = self.create
    song_mp3_split = song.split(/.-.|[.]/).reject{ |x| x == "mp3" }
    song_mp3.artist_name = song_mp3_split[0]
    song_mp3.name = song_mp3_split[1]
    song_mp3
  end

  def self.destroy_all
    self.all.clear
  end

end