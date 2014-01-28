require 'spec_helper'

describe 'adding a photo' do

    it 'should be able to upload a photo' do
      visit 'posts/new'
      fill_in 'title', with: 'My photo'
      fill_in 'content', with: 'testing adding a pic'
      attach_file 'Image', Rails.root.join('spec/images/plane.jpg')
      click_button 'Post'

      expect(current_path).to eq '/posts'
      expect(page).to have_css 'img.christagram-upload'
    end

end