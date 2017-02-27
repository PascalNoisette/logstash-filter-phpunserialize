# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

# Unserialize input field
#
class LogStash::Filters::Phpunserialize < LogStash::Filters::Base

  # This is how you configure this filter 
  # from your Logstash config.
  #
  # filter {
  #   phpunserialize {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "phpunserialize"

  # Replace the message with this value.
  config :message, :validate => :string, :default => "Hello World!"


  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)

    if @message
      # Replace the event message with our message as configured in the
      # config file.

      # using the event.set API
      event.set("message", @message)
      # correct debugging log statement for reference
      # using the event.get API
      @logger.debug? && @logger.debug("Message is now: #{event.get("message")}")
    end

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Phpunserialize
