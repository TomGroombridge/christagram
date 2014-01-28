require 'spec_helper'


describe 'liking posts' do 

        before do
            create(:post)
        end

        it "should be able to like a post" do
                visit '/posts'
                click_button 'like'
                expect(page).to have_css '.votes_count', text: '1'
        end

end