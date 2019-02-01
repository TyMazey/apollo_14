require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    describe '.average_age' do
      it 'should return average age of all astonauts' do
        astro_1 = Astronaut.create(name: "Lance Armstrong", age: 20, job: "Captain")
        astro_2 = Astronaut.create(name: "Buzz Aldren", age: 60, job: "Pilot")

        expect(Astronaut.average_age).to eq(40)
      end
    end
  end

  describe 'instance methods' do
    describe '.all_missions' do
      it 'should return all missions for an astronaut in alphabetical order' do
        astro_1 = Astronaut.create(name: "Lance Armstrong", age: 70, job: "Captain")
        two = astro_1.missions.create(title: "bee", time_in_space: 200)
        three = astro_1.missions.create(title: "cat", time_in_space: 200)
        one = astro_1.missions.create(title: "apple", time_in_space: 200)

        expect(astro_1.all_missions).to eq([one, two, three])
      end
    end

    describe '.total_time_in_space' do
      it 'should return the total time in space for an astronaut' do
        astro_1 = Astronaut.create(name: "Lance Armstrong", age: 70, job: "Captain")
        two = astro_1.missions.create(title: "bee", time_in_space: 200)
        three = astro_1.missions.create(title: "cat", time_in_space: 200)
        one = astro_1.missions.create(title: "apple", time_in_space: 200)

        expect(astro_1.total_time_in_space).to eq(600)
      end
    end
  end
end
