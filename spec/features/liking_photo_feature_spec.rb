require 'spec_helper'


describe 'liking posts' do 

        before do
            create(:post)
            create(:user)
        end

        it "should be able to like a post" do
                visit '/posts'
                click_button 'Like'
                expect(page).to have_css '.likes_count', text: '1'
        end

        it "should only be able to like the same post once" do 
        		visit '/posts'
                click_button 'Like'
                expect(page).to have_css '.likes_count', text: '1'
                click_button "Like"
                expect(page).to have_css '.likes_count', text: '1'
        end

end