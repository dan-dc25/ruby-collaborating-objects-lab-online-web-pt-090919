class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)#artist_name
    @name = name
    save
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
    if (song.artist.nil?)
      song.artist = Artist.new(name)
    else
      song.artist.name = name
    end
  end


  def self.find(name)
    @@all.find do |artist|
      artist.name == name
    end
  end

  def self.create(name)
    artist = self.new(name)
    @@all << artist
    artist
  end


  def print_songs()
   songs.each {|x| puts x.name}
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

end
