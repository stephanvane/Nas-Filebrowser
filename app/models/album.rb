# == Schema Information
# Schema version: 20110306134545
#
# Table name: albums
#
#  id     :integer         not null, primary key
#  name   :string(255)
#  folder :string(255)
#

class Album < ActiveRecord::Base
  has_many :tracks
end
