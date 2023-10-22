#!/usr/bin/env ruby

require "highline"

class MyShell
  def start
    cli = HighLine.new

    loop do
      choice = cli.ask("Ne yapmak istersiniz? (Çıkış için 'exit' yazın): ") do |q|
        q.in = %w(help list exit)
      end

      case choice
      when 'help'
        puts "Yardım mesajı burada..."
      when 'list'
        puts "Liste burada..."
      when 'exit'
        break
      end
    end
  end
end

MyShell.new.start

