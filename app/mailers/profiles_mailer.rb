class ProfilesMailer < ApplicationMailer

    def welcome(profile_id)
      @profile = Profile.find(profile_id)
      mail(to: @profile.email, from: 'from@example.com', subject: 'Successful registration')
    end
  
  end