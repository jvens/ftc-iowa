class WebhookController < ApplicationController
  def onhook
  	puts params.inspect
  end
end
