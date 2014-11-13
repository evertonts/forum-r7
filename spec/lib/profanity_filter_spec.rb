require 'rails_helper'

describe ProfanityFilter do
  
  subject { ProfanityFilter.instance  } 
  
  describe '#nomalize' do
    before do 
      allow(subject).to receive(:normalizer) { { 'a' => '@', 'b' => 'i3' } }
    end
    
    it 'changes @ to a' do
      expect(subject.normalize('lal@')).to eq 'lala'
    end
    
    it 'changes I3 to b' do
      expect(subject.normalize('I3olA')).to eq 'bola'
    end
  end
  
  describe '#sanitize!' do
    before { allow(subject).to receive(:blacklist) { 'arma' } }
    
    it 'exchange arma for XXXX' do
      expect(subject.sanitize!('arma')).to eq 'XXXX'
    end
  end
end