# encoding: utf-8
require 'spec_helper'
require "logstash/filters/phpunserialize"

describe LogStash::Filters::Phpunserialize do
  describe "Set to Hello World" do
    let(:config) do <<-CONFIG
      filter {
        phpunserialize {
          source => message
        }
      }
    CONFIG
    end

    sample("message" => "i:456;") do
      expect(subject.get("unserialized")).to eq(456)
    end
    
    sample("message" => "a:1:{s:3:\"foo\";s:3:\"bar\";}") do
      expect(subject.get("foo")).to eq("bar")
    end
  end
end
