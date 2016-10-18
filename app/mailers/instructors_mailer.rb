class InstructorsMailer < ActionMailer::Base

  # sends confirmation email to the requested instructor
  def confirm_request(request)
    @request = request

    mail( from:"app52905832@heroku.com",
          to: "#{@request.instructor.email}",
          subject: "You Have a new Request")
  end

  def admin_confirm_request(request, admins)
    @admins = admins

    # Sends email to add addmins
    @admins.each do |admin|
      @request = request
      mail( from:"app52905832@heroku.com",
            to: "#{admin.email}",
            subject: "Request Confirmation")
    end
  end
end
