module SignIn
  def create_user
    @user = User.new
    @user.email = "george@example.com"
    @user.password = "curiousmonkey"
    @user.save!
  end

  def create_user_and_sign_in
    create_user
    visit '/'
    fill_in 'Email', with: 'george@example.com'
    fill_in 'Password', with: 'curiousmonkey'
    click_button 'Log in'
  end

  def create_location
    location = Location.new(address: '2804 Lincoln Ave',
                            city: 'San Diego',
                            state: "CA",
                            zip: '92104'
                            )
    location.save
  end
end
