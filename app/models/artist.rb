# == Schema Information
# Schema version: 20110306134545
#
# Table name: artists
#
#  id   :integer         not null, primary key
#  name :string(255)
#

class Artist < ActiveRecord::Base
  has_many :albums
end
