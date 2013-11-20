#!/usr/bin/ruby
# encoding: utf-8
#

def convert_vcf(string)
	newstring = ""
	array = string.split("\t")
	elements = array[9].split(":")
	dp4 = "DP4=0," + elements[1] + ",0"
	array[7] = array[7] + ";" + dp4
	newstring = array.join("\t")
	newstring
end

lines = File.read(ARGV[0])
results = lines.split("\n")
results.each do |string|
	newstring = convert_vcf(string)
	puts newstring
end
