require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:messages)).to eq([])
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:message)).to be_a_new(Message)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "creates an message and redirects to root with valid attributes" do
      expect {
        post :create, params: { message: { :to => 'test@example.org', :subject => 'Test', :body => "This is a test" } }
      }.to change { Message.count }.from(0).to(1)

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end

    it "renders new with invalid attributes" do
      expect {
        post :create, params: { message: { to: 'test' } }
      }.to_not change { Message.count }

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
      expect(assigns(:message)).to be_a_new(Message)
    end
  end


  context 'with an email' do
    let(:message) { Message.create(:to => 'test@example.org', :subject => 'hello', :body => 'hello') }

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
        expect(assigns(:messages)).to eq([message])
        expect(response).to render_template(:index)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, params: { id: message.id }
        expect(response).to have_http_status(:success)
        expect(assigns(:message)).to eq(message)
        expect(response).to render_template(:show)
      end
    end
  end
end
