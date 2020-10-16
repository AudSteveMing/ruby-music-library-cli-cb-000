class MusicImporter

  attr_reader :path

def initialize(path)
  @path = path
end

def files
 Dir.children(@path)
end

def import
  files.each do |song|
    Song.create_from_filename(song)
  end
end
end
