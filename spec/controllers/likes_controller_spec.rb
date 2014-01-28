require 'spec_helper'

describe LikesController do

	before do
		create(:user)
		create(:post)
	end

	it "can only be liked once by the same user" do 
		visit "/posts"
		click_button "Like"
	end
end
