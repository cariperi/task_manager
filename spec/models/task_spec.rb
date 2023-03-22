require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'instance methods' do
    describe '#laundry?' do
      it 'returns true when the title is laundry' do
        task = Task.create!(title: 'laundry', description: 'clean clothes')

        expect(task.laundry?).to be(true)
      end

      it 'returns true when the description is laundry' do
        task = Task.create!(title: 'Clean my clothes', description: 'laundry')
        task_2 = Task.create!(title: 'Do my homework', description: 'homework')

        expect(task.laundry?).to be(true)
      end

      it 'returns false when neither the description nor title is laundry' do
        task_2 = Task.create!(title: 'Do my homework', description: 'homework')

        expect(task_2.laundry?).to be(false)
      end

      it 'returns true when the title contains the word laundry' do
        task = Task.create!(title: 'do my laundry', description: 'clean clothes')

        expect(task.laundry?).to be(true)
      end

      it 'is case insensitive when checking if the title contains the word laundry' do
        task = Task.create!(title: 'do my laundry', description: 'clean clothes')
        task_2 = Task.create!(title: 'do my LAUNDRY', description: 'clean clothes')

        expect(task.laundry?).to be(true)
        expect(task_2.laundry?).to be(true)
      end

      it 'returns true when the description contains the word laundry' do
        task = Task.create!(title: 'Do my clothes', description: 'start the laundry')

        expect(task.laundry?).to be(true)
      end

      it 'is case insensitive when checking if the description contains the word laundry' do
        task = Task.create!(title: 'this is a task', description: 'clean laundry')
        task_2 = Task.create!(title: 'this is a task', description: 'clean LaUndrY')

        expect(task.laundry?).to be(true)
        expect(task_2.laundry?).to be(true)
      end
    end
  end
end