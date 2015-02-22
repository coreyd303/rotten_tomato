require 'rails_helper'

RSpec.describe ResultsController, type: :controller do
  before(:each) do
    WebMock.allow_net_connect!

    5.times do
      Movie.create(title: Faker::Name.name)
    end
    @movies = Movie.all 
  end

  it 'fetches movies on get' do 
    get :index, :num => 5
    expect(:movies).to_not be(nil)
  end

  it 'breaks if limit is out of range' do 
    get :index, :num => 500
    expect(flash[:danger]).to include('valid')
    expect(response).to be_redirect
  end

  describe 'GET index' do
    it 'renders the index template' do 
      get :index, :num => 5
      expect(response).to render_template('index')
    end
  end
end
