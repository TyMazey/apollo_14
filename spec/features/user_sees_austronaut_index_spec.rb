require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do

  describe 'when user visits the index page' do
    it 'shows all astronauts and basic info about them' do
      astro_1 = Asronaut.create(name: "Lance Armstrong", age: 70, job: "Captain")
      astro_2 = Asronaut.create(name: "Buzz Aldren", age: 74, job: "Pilot")

      visit astronauts_path

      within "#astronaut-#{astro_1.id}" do
        expect(page).to have_content('Lance Armstrong')
        expect(page).to have_content('70')
        expect(page).to have_content('Captain')
      end
      within "#astronaut-#{astro_2.id}" do
        expect(page).to have_content('Buzz Aldren')
        expect(page).to have_content('74')
        expect(page).to have_content('Pilot')
      end
    end
  end
end
