# Was global now will run on environments > development and production only, excluding test.
unless Rails.env.test?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address                =>  'smtp.sendgrid.net',
    :port                   =>  '587',
    :authentication         =>  :plain,
    :user_name              =>  'app65740160@heroku.com',
    :password               =>  'wktds0oc2454',
    :domain                 =>  'heroku.com',
    :enable_starttls_auto   =>  true
  }
end
