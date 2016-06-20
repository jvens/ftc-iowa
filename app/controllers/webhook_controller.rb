class WebhookController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def onhook
	puts "hook data:"
  	puts params.inspect
	puts "restart server"
	system "./restart.sh"
  end
end
