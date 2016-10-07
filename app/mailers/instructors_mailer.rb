class InstructorsMailer < ActionMailer::Base

  def confirm_request(request)
    @request = request


    mail( from:"app52905832@heroku.com",
          to: "#{@request.instructor.email}",
          subject: "You Have a new Request")
  end
end
