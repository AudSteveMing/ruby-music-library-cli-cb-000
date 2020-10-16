require 'pry'

class Song

  attr_accessor :name, :artist
  attr_reader :genre

@@all = []

def initialize(name, artist_y=nil, genre = nil)
  @name = name
  @genre = genre
  self.genre = genre if genre
  if artist_y != nil
  self.artist=artist_y
  end
    # self.artist=(artist)
end

def self.create(name)
  new_song = Song.new(name)
  new_song.save
  new_song
end

def save
  @@all << self
end

def self.all
  @@all
end

def self.destroy_all
@@all = []
end

def artist=(artist)
  @artist = artist
  @artist.add_song(self)
#<song object id @name, @artist>
#new_song.artists=

#artist.add_song(song)
#<artist object id @name, [@songs array]>

# artist.add_song(song)
#
# expect(song.artist).to be(artist)
end

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
end

def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
end

# def self.find_or_create_by_name(name)
# self.create(name) || self.find_by_name(name)
#
# end

def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
 end

# def self.new_from_filename(filename)
#   #cut the string
#   full_song = filename.split(" - ")
#   new_song = self.find_or_create_by_name(full_song[1])
#   new_song.artist=(full_song[0])
#
# end

def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save }
  end

# binding.pry
end
