# == Schema Information
# Schema version: 20110306134545
#
# Table name: tracks
#
#  id        :integer         not null, primary key
#  name      :string(255)
#  nr        :integer
#  file      :string(255)
#  album_id  :integer
#  artist_id :integer
#

class Track < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist
end
