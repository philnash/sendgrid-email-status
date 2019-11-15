class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    events = params["_json"]
    events.each do |event|
      next unless event["id"]
      message = Message.find(event["id"])
      message.update_attribute(:status, event["event"])
    end
    head :ok
  end
end
