class Message < ApplicationRecord
  validates :to,
    :presence => true,
    :format => { :with => /\A[^\s]+@[^\s]+\z/, :message => "doesn't look like an email address" }
  validates :subject, :presence => true
  validates :body, :presence => true

  def status
    self['status'] || "created"
  end
end
