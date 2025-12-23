module AresMUSH
  module Cod
    def self.plugin_dir
      File.dirname(__FILE__)
    end
  end
end

AresMUSH::Plugin.define do
  name "cod"
  author "Dark of Night"
  description "Chronicles of Darkness system (registry refactor)"
  version "2.8.0"
end
