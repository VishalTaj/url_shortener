class Link < ApplicationRecord

  belongs_to :authorize_token

  after_create do
    self.update_attribute(:shorten_hash, url_hash)
  end

  def self.expand_hash(id)
    id.to_i(36) - Settings.offset
  end

  def url_hash
    (self.id + Settings.offset).to_s(36)
  end

  def shorten_url
    "#{Rails.configuration.site_origin}/shorten/#{shorten_hash}" rescue ""
  end

  #=> Formats

  def as_json(opts={})
    super(only: [:url, :title, :description]).tap do |resource|
      resource[:shorten_url] = self.shorten_url
    end
  end
end