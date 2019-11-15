require 'rails_helper'

RSpec.describe "messages/new.html.erb", type: :view do
  it "shows a form" do
    assign(:message, Message.new)

    render

    expect(response).to have_text 'New Message'
  end

  it 'shows form errors' do
    message = Message.new
    message.valid?
    assign(:message, message)

    render

    expect(response).to have_selector '.alert-danger'
  end
end
