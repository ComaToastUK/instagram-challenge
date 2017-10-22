require 'rails_helper'

feature 'it has a root page' do
  scenario 'a user views the root' do
  visit '/'
  expect(page).to have_content('Instagrin')
  end
end

feature 'a user can post an image' do
  scenario 'a user posts a picture of their cat' do
    visit '/posts/new'
    fill_in 'post[image]',   with: 'cat.jpeg'
    fill_in 'post[caption]', with: 'cat <3'
    submit_form
    visit '/'
    expect(page).to have_content 'cat <3'
  end
end

feature 'a user can comment on an image' do
  scenario 'user wants to comment on the image of another user' do

  end
end

feature 'a user can sign up to instagrin' do
  scenario 'a new user joins instagrin' do

  end
end

feature 'a user can comment on another users post' do
  scenario 'user1 wants to comment on user2 picture' do

  end
end

private

def sign_up
  visit 'users/new' do
    fill_in ''
  end
end

def submit_form
   find('input[name="commit"]').click
end

def post_params
  params.require(:post).permit(:image, :caption)
end
