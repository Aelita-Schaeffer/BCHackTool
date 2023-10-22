#!/usr/bin/env ruby


require "readline"
while input = Readline.readline("> ", true)
	break if input == "exit"
	system(input)
end
