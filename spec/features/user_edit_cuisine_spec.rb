require 'rails_helper'

feature 'User update cuisine' do
  scenario 'successfully' do
    arabian_cuisine = Cuisine.create(name: 'Arabi')
    brasilian_cuisine = Cuisine.create(name: 'Brasileira')


    visit root_path
    click_on 'Arabi'
    click_on 'Editar'

    fill_in 'Nome', with: 'Arabe'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Arabe')
  end

  scenario 'nane must be filled' do
    arabian_cuisine = Cuisine.create(name: 'Arabe')

    visit root_path
    click_on 'Arabe'
    click_on 'Editar'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_css('li', text: 'A cozinha deve ter um nome')
  end

  scenario 'cuisine must be uniq' do

    arabian_cuisine = Cuisine.create(name: 'Arabe')
    brazillian_cuisine = Cuisine.create(name: 'Brazil')

    visit root_path
    click_on 'Arabe'
    click_on 'Editar'

    fill_in 'Nome', with: 'Brazil'
    click_on 'Enviar'

    expect(page).to have_css('li', text:'Esse nome de cozinha ja existe')
  end

end
