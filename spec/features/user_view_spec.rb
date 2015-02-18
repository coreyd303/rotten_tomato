require 'rails_helper'

RSpec.describe 'the user view', type: :feature do 

  context 'the home page' do
    before(:each) do 
      visit ('/')
    end

    it 'sees the home page' do 
      expect(current_path).to eq('/')

      expect(page).to have_content('Welcome to MovieYak')
      expect(page).to have_link('Last Weekends Box Office Results')
      expect(page).to have_link('Future Box Office Rankings')
    end

    it 'sees the lasts weeks movie results page' do 
      expect(current_path).to eq('/')
      click_link('Last Weekends Box Office Results')

      expect(current_path).to eq(results_path)
      expect(page).to have_link('MovieYak Home')
      expect(page).to have_link('Future Box Office Rankings')

      exect(page).to_not have_link('Last Weekends Box Office Results')

      click_link('MovieYak Home')
      expect(current_path).to eq('/')
    end

    it 'sees the future rankings page' do
      expect(current_path).to eq('/')
      click_link('Future Box Office Rankings')

      expect(current_path).to eq(future_path)
      expect(page).to have_link('MovieYak Home')
      expect(page).to have_link('Last Weekends Box Office Results')

      expect(page).to_not have_link('Future Box Office Rankings')

      click_link('MovieYak Home')
      expect(current_path).to eq('/')
    end
  end
end