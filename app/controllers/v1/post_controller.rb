module V1
	class PostController < ApplicationController
		def runParser
			RealTimeParserJob.perform_now
			render text: "Run!"
		end
	end
end
