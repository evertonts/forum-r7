require 'rails_helper'

describe ProfanityFilter do
  describe '#nomalize' do
    it 'changes @ to a' do
      expect(subject.normalize('lal@')).to eq 'lala'
    end
    
    it 'changes I3 to b' do
      expect(subject.normalize('I3olA')).to eq 'bola'
    end
  end
end