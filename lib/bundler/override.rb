# frozen_string_literal: true
require "set"

module Bundler
  module Override
    class << self
      def override?(name)
        return unless @gems
        @gems.include? name
      end

      def params(name)
        return [] unless @gems
        return [] unless @gems.include? name
        @params.find { |o| o[:name] == name }
      end

      def add(name, drop, requirements)
        @gems = Set.new unless @gems
        return if @gems.include? name
        @gems << name
        @params = Array.new unless @params
        @params << { :name => name, :drop => drop || [], :requirements => requirements }
      end
    end
  end
end
