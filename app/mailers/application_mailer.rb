class ApplicationMailer < ActionMailer::Base
  # default from: %{ "TestGuru" <mail@testguru.com> }
  default from: 'mail@testguru.com'
  layout 'mailer'
end
