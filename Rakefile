require "bundler/gem_tasks"
require "rake/testtask"
require "rake/guardian"
load 'test/rake/test_task.rake'

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

