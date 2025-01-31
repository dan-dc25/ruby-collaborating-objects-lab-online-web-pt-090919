class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)#artist_name
    @name = name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end


  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end


  def self.find(name)
    @@all.find do |artist|
      artist.name == name
    end
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    #@@all << artist
   artist

  end


  def print_songs()
   songs.each {|x| puts x.name}
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

end
