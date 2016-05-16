require 'rails_helper'
require 'spec_helper'

describe Contact do
  it 'has a valid factory' do
    expect(create(:contact)).to be_valid
  end
end
