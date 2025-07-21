#!/usr/bin/env ruby

require_relative '../../bindings/ruby/cellforge'

def main
  begin
    cf = CellForge.new
    puts cf.hello
  rescue => e
    puts "Error: #{e.message}"
    exit 1
  end
end

if __FILE__ == $0
  main
end 