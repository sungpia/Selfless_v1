require 'apns'
class YouMadeJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
	  APNS.host = 'gateway.sandbox.push.apple.com'
	  APNS.pem  = '/home/ubuntu/Selfless/pem/ck.pem'
	  APNS.port = 2195
	  APNS.send_notification(args[0], 'Your donation is made!' )
  end
end
