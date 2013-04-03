require "bundler/gem_tasks"
require 'rspec/core/rake_task'

namespace :spec do

  desc "Run RSpec"
  RSpec::Core::RakeTask.new(:run) do |t|
    t.rspec_opts = '-c'
    t.verbose = false
  end

  desc "Run RSpec and generate coverage"
  task :cov do
    ENV['COVERAGE'] = 'true'
    Rake::Task['spec:run'].execute
  end
end

desc "Run RSpec"
task :spec => 'spec:run'