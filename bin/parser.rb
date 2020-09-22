#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative './../app/runner'

path = ARGV.first
raise ArgumentError, 'Please provide file path' unless path

Parser::Runner.new(path).call
