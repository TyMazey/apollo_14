require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do

  describe 'when user visits the index page' do
    it 'shows all astronauts and basic info about them' do
      astro_1 = Astronaut.create(name: "Lance Armstrong", age: 70, job: "Captain")
      astro_2 = Astronaut.create(name: "Buzz Aldren", age: 74, job: "Pilot")

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

    it ' shows the average age of every astronaut' do
      astro_1 = Astronaut.create(name: "Lance Armstrong", age: 20, job: "Captain")
      astro_2 = Astronaut.create(name: "Buzz Aldren", age: 60, job: "Pilot")

      visit astronauts_path

      within ".statistics" do
        expect(page).to have_content(40)
      end
    end

    it 'shows all missions alphabeticly for astronauts' do
      astro_1 = Astronaut.create(name: "Lance Armstrong", age: 70, job: "Captain")
      astro_1.missions.create(title: "bee", time_in_space: 200)
      astro_1.missions.create(title: "cat", time_in_space: 200)
      astro_1.missions.create(title: "apple", time_in_space: 200)

      visit astronauts_path

      within "#astronaut-#{astro_1.id}" do
        expect(page).to have_content('apple')
        expect(page).to have_content('bee')
        expect(page).to have_content('cat')
      end
    end
  end
end
