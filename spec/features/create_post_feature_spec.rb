require 'spec_helper'

describe 'creating a post' do

  context 'given a title and content' do

    it 'should display the title of the list of posts' do
      visit 'posts/new'
      fill_in 'Title', with: 'new post'
      fill_in 'Content', with: 'my testing post'
      click_button 'Create Post'

      expect(current_path).to eq '/posts'
      expect(page).to have_content 'new post'
    end


  end

end