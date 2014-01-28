require 'spec_helper'

describe 'creating a post' do


  context 'given a title and content' do

    it 'should display the title of the list of posts' do
      visit 'posts/new'
      fill_in 'title', with: 'new post'
      fill_in 'content', with: 'my testing post'
      fill_in 'tags', with: 'hello, world'
      click_button 'Post'

      expect(current_path).to eq '/posts'
      expect(page).to have_content 'new post'
      expect(page).to have_content '#hello #world'
    end


  end

end