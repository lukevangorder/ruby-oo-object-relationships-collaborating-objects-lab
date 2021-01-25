class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all.push(self)
        @songs = []
    end
    def self.all
        @@all
    end
    def add_song(song)
        song.artist = self
    end
    def songs
        Song.all.each do |song|
            if song.artist == self
                @songs.push(song)
            end
        end
        @songs
    end
    def self.find_or_create_by_name(filename)
        words = filename.split(" - ")
        artist1 = words[0]
        name1 = words[1]
        if @@all.find {|artist| artist.name == artist1} == nil 
            return Artist.new(artist1)
        else
            return @@all.find {|artist| artist.name == artist1}
        end
    end
    def print_songs
        self.songs.each {|song| puts song.name}
    end
end