class EpisodeGuestSerializer < ActiveModel::Serializer
  attributes :id, :date, :number
  has_many :guests, through: :appearances
end
