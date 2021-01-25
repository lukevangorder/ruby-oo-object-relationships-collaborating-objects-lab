require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def self.new_by_filename(filename)
        words = filename.split(" - ")
        new_instance = Song.new(words[1])
        artist_working = Artist.find_or_create_by_name(words[0])
        Artist.all.each do |artist1|
            if artist1.name == words[0]
                new_instance.artist_name=(words[0])
                artist_working.add_song(new_instance)
            end
        end
        @@all.push(new_instance)
        return new_instance
    end
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
    end
end