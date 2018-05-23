require 'spec_helper'
include SessionsHelper

RSpec.describe 'posts/index.html.erb' do

  before do
    Rails.application.load_seed
  end

  context 'when the user is logged in' do
    it 'displays the author name' do
      log_in(User.first)

      assign(:posts, Post.create([{ title: "Something long enough", user_id: 1, body: "Text goes here, I hope." }, { title: "This is a title", body: "Yep, this is some text.", user_id: 1 }]))

      render

      expect(rendered).to have_text('Author:')
    end
  end

  context 'when the user is not logged in' do
    it 'does not display the author name' do
      assign(:posts, Post.create([{ title: "Something long enough", user_id: 1, body: "Text goes here, I hope." }, { title: "This is a title", body: "Yep, this is some text.", user_id: 1 }]))

      render

      expect(rendered).to_not have_text('Author:')
      expect(rendered).to have_text('You must be logged in to see the authors of each post.')
    end
  end

end
