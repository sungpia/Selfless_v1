require 'net/http'
require 'json'

class TagParserJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
	  url = args[0]
	user_insta_id = args[1]
	  result = Net::HTTP.get(URI.parse(url))
	  j = JSON.parse(result)
		tag = "#selflessdfwdonate"
	  j["data"].each do |data|
		  user_id= data["user"]["id"]
		  insta_post_id = data["id"]
		  default_charity_id = User.find_by(insta_id: data["user"]["id"]).default_charity_id
		  if p=Post.where(user_id: user_id, insta_post_id: insta_post_id, charity_id: default_charity_id)[0] == NIL
				p = Post.new
				p.user_id = user_id
				p.insta_post_id= insta_post_id
				p.charity_id= default_charity_id
				p.save
				PostMadeJob.perform_now(User.find_by(user_id).push_id)
		  end
		  data["comments"]["data"].each do |comment|
			  insta_comment_id = comment["id"]
			  insta_id = comment["from"]["id"]
				puts insta_comment_id
				puts insta_id
			  puts p
			if comment["text"][tag]
					# chk duplicate
					if Donation.where(host_insta_id: user_id, insta_comment_id: insta_comment_id, insta_id: insta_id)[0] == NIL
						d = Donation.new
						d.post_id = Post.find_by(user_id: user_id, insta_post_id: insta_post_id, charity_id: default_charity_id).id
						d.amount = 1
						d.host_insta_id = user_id
						d.insta_id = insta_id
						d.insta_comment_id = insta_comment_id
						d.save
						if User.find_by(insta_id: insta_id).push_id 
							YouMadeJob.perform_now(User.find_by(insta_id: insta_id).push_id)
						end
						SomeoneMadeJob.perform_now(User.find_by(insta_id: user_id).push_id)
					end
			  end

		  end
	  end
  end
end
