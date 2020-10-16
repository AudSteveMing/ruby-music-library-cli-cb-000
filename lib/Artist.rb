class Artist
  extend Concerns::Findable

attr_accessor :name
attr_reader :songs

@@all = []

def initialize(name)
  @name = name
  @songs = []
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

def self.create(name)
  new_song = Artist.new(name)
  new_song.save
  new_song
end

# def songs
#   @songs
# end

def add_song(song)
  @songs << song unless songs.include?(song)
  if song.artist == nil
    song.artist = self
  end
end

# def add_song(song)
#   song.artist = self unless song.artist
#   songs << song unless songs.include?(song)
# end
#artist.add_song(song)
#<artist object id @name, [@songs array]>

# artist.add_song(song)
#
# expect(song.artist).to be(artist)


def genres
    songs.collect{ |s| s.genre }.uniq
  end

end
