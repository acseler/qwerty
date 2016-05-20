require 'rails_helper'

RSpec.describe Country, type: :model do
  subject(:country) { FactoryGirl.build(:country, params) }
  let(:params) { }

  %i(name).each do |symb|
    it { should have_db_column(symb) }
    it { should validate_presence_of(symb) }
    it { should validate_uniqueness_of(symb) }
  end


  it 'has valid factory' do
    expect(country).to be_valid
  end
end
