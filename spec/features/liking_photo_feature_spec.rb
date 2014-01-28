require 'spec_helper'


describe 'liking posts' do 

        before do
            create(:post)
        end

        it "should be able to like a post" do
                visit '/posts'
                click_button 'Like'
                expect(page).to have_css '.likes_count', text: '1'
        end

end