namespace :files do
  task :store => :environment do
    require 'rubygems'
    require 'mp3info'

    files = Dir.glob('/Users/stephan/Music/tagged/*/*/*.mp3')
    files = Dir.glob('/Users/stephan/Music/tagged/Parov Stelar/That Swing/*.mp3')

    files.each do |f|

      next if File.directory? f
      Mp3Info.open f, :encoding => 'utf-8' do |mp3|
        begin
          title = mp3.tag2.TIT2.force_encoding 'utf-8'
      
          album = mp3.tag2.TALB.force_encoding 'utf-8'
          artist = mp3.tag2.TPE1.force_encoding 'utf-8'
          nr = mp3.tag2.TRCK.force_encoding 'utf-8'
      
          track = Track.new(:name => title)
          track.album = Album.find_or_create_by_name_and_folder(album, File.dirname(f))
          track.artist = Artist.find_or_create_by_name(artist)
          track.nr = nr
          track.save
          puts "Saved #{track.name}"
        rescue
          puts f
          puts mp3.tag2.TIT2.encoding
          puts mp3.tag2.TIT2.valid_encoding?
        end
      end
    end
  end
end