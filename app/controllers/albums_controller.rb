require 'archive/tar/minitar'
include Archive::Tar

class AlbumsController < ApplicationController
  caches_page :index
  
  def index
    @albums = Album.all
  end
  
  def show
    @album = Album.find(params[:id])    
  end
  
  def download
    @album = Album.find params[:album_id]
    headers.merge!(
      'Content-Disposition'  => 'attachment; filename=a.tar',
      'Content-Transfer-Encoding' => 'binary'
    )
    response.sending_file = true
    
    dir = File.join [Nas::Application.config.music_folder, @album.folder]
    
    self.response_body = proc { |response, output|
      o = Minitar::Output.new output
      
      Dir.chdir dir do
        Dir.glob '*.mp3' do |f|
          Minitar.pack_file(f, o)
        end
      end
    }
  end
end
