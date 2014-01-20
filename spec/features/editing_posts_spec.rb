require 'spec_helper'

describe 'editing' do

  before do
    create(:post)
  end

  it 'should change the post' do
    visit '/posts'
    click_link 'edit'
    fill_in 'Title', with:'goodbye world'
    fill_in 'Content', with:'see you later'
    click_button 'Update Post'
    expect(page).to have_content 'goodbye world'
    expect(page).to have_content 'see you later'
  end

end