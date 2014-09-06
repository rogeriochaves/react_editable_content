# encoding: UTF-8
require "bundler/gem_tasks"
require "rails/test_unit/railtie"

desc 'Run editable_content unit tests.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
  t.warning = false
end