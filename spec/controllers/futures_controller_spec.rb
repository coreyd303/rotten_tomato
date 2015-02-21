require 'rails_helper'

RSpec.describe FuturesController, type: :controller do

  describe 'GET index' do
    before(:each) do 
      5.times do 
        Movie.create(title:             Faker::Name.name)
      end
      m = Movie.all
      @movies = m.collect { |m| m.title }
      get(:index)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'assigns @movies' do
      expect(assigns(:movies)).to eq(@movies)
    end

    it 'shuffles @movies when it assigns @week_one' do
      expect(@movies).to_not eq(@week_one)
    end

    it 'shuffles @movies when it assigns @week_two' do
      expect(@movies).to_not eq(@week_two)
    end
  end
end
