require 'rails_helper'

RSpec.describe "messages/show.html.erb", type: :view do
  it "shows the message details" do
    message = Message.create(to: 'test@example.org', subject: 'hello', body: 'what up!')
    assign(:message, message)

    render

    expect(response).to have_text message.to
    expect(response).to have_text message.subject
    expect(response).to have_text message.body
    expect(response).to have_text message.status
  end
end
