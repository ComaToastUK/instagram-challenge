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
    fill_in 'post[image]',   with: 'http://www.petsworld.in/blog/wp-content/uploads/2014/09/adorable-cat.jpg'
    fill_in 'post[caption]', with: 'cat in the hat <3'
    submit_form
    visit '/'
    expect(page).to have_content 'cat in the hat <3'
  end
end

private

def submit_form
   find('input[name="commit"]').click
end

def post_params
  params.require(:post).permit(:image, :caption)
end
