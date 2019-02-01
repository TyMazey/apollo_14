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
end
