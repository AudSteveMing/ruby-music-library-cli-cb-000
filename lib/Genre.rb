class Genre
  extend Concerns::Findable


attr_accessor :name, :songs

@@all = []

def initialize(name)
  @songs = []
  @name = name
  # @songs << self
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
  new_song = Genre.new(name)
  new_song.save
  new_song
end

def artists
  list = self.songs.collect do |song|
      song.artist
    end
    list.uniq
end


# def songs
#   @songs
# end

end
