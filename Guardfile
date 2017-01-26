# Adequate Rails Api Guardfile
# Guard: https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

# Require inflections library to Singularize and Pluralize
# These methods necessary to find Model's controller, Controller's model test(s)
# TODO: Find better way to load this.
require 'rails'
require 'active_support/inflections'

guard :minitest, spring: 'bin/rails test' do
  # with Minitest::Unit
  watch(%r{^test/(.*)\/?(.*)_test\.rb$})
  watch(%r{^test/test_helper\.rb$})      { 'test' }

  # Rails
  watch(%r{^app/(.+)\.rb$})                                { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^app/controllers/application_controller\.rb$})  { 'test/controllers' }
  watch(%r{^app/controllers/(.+)_controller\.rb$})         { |m| "test/integration/#{m[1]}_test.rb" }
  watch(%r{^app/views/(.+)_mailer/.+})                     { |m| "test/mailers/#{m[1]}_mailer_test.rb" }

  # Run related controller test when model updated.
  watch(%r{^app/models/(.+)\.rb$})                         { |m| "test/controllers/v1/#{m[1].pluralize}_controller_test.rb" }
  # Run related model test when fixture updated.
  watch(%r{^test/fixtures/(.+)\.yml$})                     { |m| "test/models/#{m[1].singularize}_test.rb" }
  # Run all model tests when application_record updated.
  watch(%r{^app/models/application_record\.rb$})           { 'test/models' }
  # Run all model tests when schema.rb updated.
  watch(%r{^app/db/schema\.rb$})                           { 'test/models' }
  # Run job tests
  watch(%r{^test/jobs/(.+)_test\.rb$})                     { |m| "test/jobs/#{m[1]}_test.rb" }
  # Run related job test when any job updated.
  watch(%r{^app/jobs/(.+)_job\.rb$})                       { |m| "test/jobs/#{m[1]}_test.rb" }
  # Run all job tests if application_jobs updated.
  watch(%r{^app/models/application_job\.rb$})              { 'test/jobs' }

  watch(%r{^app/services/(.+)_job\.rb$})                   { |m| "test/services/#{m[1]}_test.rb" }
end

guard :rubocop do
  watch(%r{.+\.rb$})
  watch(%r{.+\.rake$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard :brakeman, run_on_start: true, quiet: true do
  watch(%r{^app/.+\.(erb|haml|rhtml|rb)$})
  watch(%r{^config/.+\.rb$})
  watch(%r{^lib/.+\.rb$})
  watch('Gemfile')
end
