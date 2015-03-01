
class RealTimeParserJob < ActiveJob::Base
  queue_as :low_priority

  def perform(*args)

		jobs = Auth.all
		jobs.each do |job|
			user_insta_id = job.user.insta_id
			access_token = job.auth_token
			tag = "selflessdfw"
			url = "https://api.instagram.com/v1/tags/#{tag}/media/recent?access_token=#{access_token}&count=10"

			TagParserJob.perform_now(url, user_insta_id)
		end
	  # Do something later
	sleep 10
	RealTimeParserJob.perform_later
  end
end
