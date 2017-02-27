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
  #     source => "source_fieldname"
  #   }
  # }
  #
  config_name "phpunserialize"

  # Source field to convert
  config :source, :validate => :string, :required => true
  
  # Target field name
  config :target, :validate => :string, :default => 'unserialized'
  
  # Append values to the `tags` field when unserialisation fails
  config :tag_on_failure, :validate => :array, :default => ["_unserialisationfailure"]

  public
  def register
    # Add instance variables
    require "php_serialize"
  end # def register

  public
  def filter(event)
    
      begin
        deserialized = PHP.unserialize(event.get(@source));
      rescue 
        @tag_on_failure.each {|tag| event.tag(tag)}
        deserialized =  "unserialize error"
      end
        
      if !deserialized.is_a?(Hash)
        deserialized = {@target => deserialized}
      end
    
      deserialized.each_pair do |k, v|
        event.set(k, v)
      end

      # filter_matched should go in the last line of our successful code
      filter_matched(event)
  end # def filter
end # class LogStash::Filters::Phpunserialize
