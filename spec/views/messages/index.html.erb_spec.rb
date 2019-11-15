require 'rails_helper'

RSpec.describe "messages/index.html.erb", type: :view do
  describe "with no messages" do
    it "is titled Messages and links to a new email form"  do
      assign(:messages, [])
      render
      expect(response).to have_selector 'h1', text: 'Messages'
      expect(response).to have_text 'You haven\'t created any messages yet. Create your first message.'
    end
  end

  describe "with messages" do
    it 'lists the messages' do
      message = Message.new(to: 'test@example.org', subject: 'Hello messages', body: 'Test body')
      message.id = 123
      assign(:messages, [message])
      render
      expect(response).to_not have_text 'You haven\'t created any messages yet. Create your first message.'
      expect(response).to have_text message.subject
      expect(response).to have_link 'show', href: message_path(123)
    end
  end
end
