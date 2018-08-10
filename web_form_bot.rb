require_relative './lib/suites/bost_inno_readers_choice/suite'

def time_process
  start = Time.now
  yield
  Time.now - start
end

num_times = ARGV[0] || 1000

total_time = time_process do
  num_times.times do |i|
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
