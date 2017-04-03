require 'rails_helper'
#Testing self.new_with_session(params,session)

#Testing for def self.from_omiauth(auth)
RSpec.describe User, type: :model do
    context "As a user I can sign in using Facebook"
    it "Has a valid name, email, and password confirmation" do
      mash = Hashie::Mash.new(credentials: {
                             expires: true,
                             expires_at: 1496427142,
                             token: "EAABbqNUOl4cBAE3ZAyHdjf1byo2jtHRlR15NSsOH9f5T2tk65HXBvz1SUDu83jRbswJBVVb1ocZBRphIr3hkiWpXHWwe5LvPekflGp8MxUZCf4lGG1C1ZBzurZAbLZBIhzUo6aNDL6kyZAtxrshpRMz9pTsKbHLB1UZD"
                           },
                        extra: {
                          raw_info: {
                            email: "chuckin09@yahoo.com",
                            id: "10155227120838169",
                            name: "Charlie Kiesewetter"
                          }
                        },
                        info: {
                          email: "chuckin09@yahoo.com",
                          image: "http://graph.facebook.com/v2.6/10155227120838169/picture",
                          name: "Charlie Kiesewetter"
                        },
                        provider: "facebook",
                        uid: "10155227120838169"
                      )
      @user = User.from_omniauth(mash)
      describe "User" do
        it "has to validate name email and id" do
          expect{User.from_omniauth}. to eq ("Charlie Kiesewetter")
          expect{User.email.from_omniauth}. to eq ("chuckin09@yahoo.com")
          expect{User.id.from_omniauth}. to eq ("10155227120838169")

        end
      end
  end
end
