namespace :db do
  task :drop do
    $stderr.puts 'run db:drop'
  end
end

namespace :test do
  task :other do
    $stderr.puts 'run test:other'
  end
end
