require 'spec_helper'

describe Post do
  it 'can be given comma-seperated tags' do
    post = create(:post, tag_names: 'hello, world')
    expect(post.tags.count).to eq 2
  end

  it 'reuses tags which already exist' do
    post = create(:post, tag_names: 'hello, world')
    second_post = create(:post, tag_names: 'hello, tbt')
    expect(Tag.count).to eq  3
  end

end
