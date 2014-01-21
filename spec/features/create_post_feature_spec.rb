require 'spec_helper'

# def create_a_user
#   @user = User.create(email: 'tom@t.com', password: '123456789', password_confirmation: '123456789')
# end

describe 'creating a post' do

  # before do 
  #   login_as create(:user)
  #   visit 'users/sign_in'
  # end

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