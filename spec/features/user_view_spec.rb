require 'rails_helper'

RSpec.describe 'the user view', type: :feature do 

  context 'the home page' do
    before(:each) do
      WebMock.allow_net_connect!
      visit ('/')
    end

    it 'sees the home page' do 
      expect(current_path).to eq('/')

      expect(page).to have_content('Welcome to MovieYak')
      expect(page).to have_button('Get Last Weekends Box Office Results')
      expect(page).to have_button('Future Box Office Rankings')
    end

    it 'sees the lasts weeks movie results page' do 
      expect(current_path).to eq('/')
      click_button('Get Last Weekends Box Office Results')

      expect(current_path).to eq(results_path)
      expect(page).to have_link('MovieYak Home')
      expect(page).to have_button('See Future Box Office Rankings')

      expect(page).to_not have_button('Get Last Weekends Box Office Results')

      click_link('MovieYak Home')
      expect(current_path).to eq('/')
    end

    it 'diplays the correct number of movies by default on the results page' do
      click_button('Get Last Weekends Box Office Results')
      expect(page).to have_content("10)")
      expect(page).to_not have_content("11)")
    end

    it 'sees the future rankings page' do
      expect(current_path).to eq('/')
      click_button('See Future Box Office Rankings')

      expect(current_path).to eq(futures_path)
      expect(page).to have_link('MovieYak Home')
      expect(page).to have_button('Get Last Weekends Box Office Results')

      expect(page).to_not have_button('See Future Box Office Rankings')

      click_link('MovieYak Home')
      expect(current_path).to eq('/')
    end
  end
end