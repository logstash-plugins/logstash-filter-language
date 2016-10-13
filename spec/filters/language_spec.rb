# encoding: UTF-8
require "logstash/devutils/rspec/spec_helper"
require "logstash/filters/language"

describe LogStash::Filters::Language do

  describe "defaults" do
    config <<-CONFIG
      filter {
        language { }
      }
    CONFIG

    sample 'Logstash-filter-language creates a field with detected language' do
      insist { subject.get('detected_lang') } == 'en'
      insist { subject.get('lang_reliability')} == true
    end
  end
end
