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
  end
end