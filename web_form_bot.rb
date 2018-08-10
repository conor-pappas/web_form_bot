require_relative './lib/suites/bost_inno_readers_choice/suite'
require 'parallel'

def time_process
  start = Time.now
  yield
  Time.now - start
end

num_times = ARGV[0] ? ARGV[0].to_i : 1000

total_time = time_process do
  Parallel.each(num_times.times, in_threads: 8) do |i|
    time = time_process do
      begin
        BostInnoReadersChoice::Suite.new.run
      rescue StandardError => e
        puts e
        puts 'FAILED'
      end
    end
    puts "#{i}: #{time}"
  end
end
puts "Total Time: #{total_time}"
puts "Average Time: #{total_time/num_times}"
