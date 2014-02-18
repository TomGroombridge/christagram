require 'spec_helper'

describe "deleting the post" do

	let(:tom) { create(:user) }

  before do
    create(:post, user: tom)
    login_as tom
  end



  it 'should delete the post from the database' do
    visit '/posts'
    click_link 'del'
    expect(page).not_to have_content 
  end





end