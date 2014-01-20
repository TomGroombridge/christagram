require 'spec_helper'

describe "deleting the post" do
  
  before do
    create(:post)
  end

  it 'should delete the post from the database' do
    visit '/posts'
    click_link 'delete'
    expect(page).not_to have_content 'hello world'
  end





end