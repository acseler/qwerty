require 'rails_helper'

RSpec.describe Book, type: :model do
  %i(title description price stock category_id author_id).each do |symb|
    it { should have_db_column(symb) }
  end

  %i(title price stock).each do |symb|
    it { should validate_presence_of(symb) }
  end

  %i(author category).each do |symb|
    it { should belong_to(symb) }
  end

  it { should have_many(:ratings)}

  it 'has valid factory' do
    expect(FactoryGirl.build(:book)).to be_valid
  end
end
