# frozen_string_literal: true

# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exist?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard 'annotate', tests: false do
  watch('db/schema.rb')

  # Uncomment the following line if you also want to run annotate anytime
  # a model file changes
  # watch( 'app/models/**/*.rb' )

  # Uncomment the following line if you are running routes annotation
  # with the ":routes => true" option
  # watch( 'config/routes.rb' )
end

guard :brakeman, quiet: true, run_on_start: true do
  watch(%r{^app/.+\.(erb|haml|rhtml|rb)$})
  watch(%r{^config/.+\.rb$})
  watch(%r{^lib/.+\.rb$})
  watch('Gemfile')
end

guard :bundler do
  require 'guard/bundler'
  require 'guard/bundler/verify'
  helper = Guard::Bundler::Verify.new

  files = ['Gemfile']
  files += Dir['*.gemspec'] if files.any? { |f| helper.uses_gemspec?(f) }

  # Assume files are symlinked from somewhere
  files.each { |file| watch(helper.real_path(file)) }
end

# A sample Guardfile
# Guard-HamlLint supports a lot options with default values:
# all_on_start: true        # Check all files at Guard startup. default: true
# haml_dires: ['app/views'] # Check Directories. default: 'app/views' or '.'
# cli: '--fail-fast --no-color' # Additional command line options to haml-lint.
guard :haml_lint do
  watch(/.+\.html.*\.haml$/)
  watch(%r{(?:.+/)?\.haml-lint\.yml$}) { |m| File.dirname(m[0]) }
end

guard 'livereload' do
  extensions = {
    css:    :css,
    scss:   :css,
    sass:   :css,
    js:     :js,
    coffee: :js,
    html:   :html,
    png:    :png,
    gif:    :gif,
    jpg:    :jpg,
    jpeg:   :jpeg
    # less: :less, # uncomment if you want LESS stylesheets done in browser
  }

  rails_view_exts = %w[erb haml slim]

  # file types LiveReload may optimize refresh for
  compiled_exts = extensions.values.uniq
  watch(%r{public/.+\.(#{compiled_exts * '|'})})

  extensions.each do |ext, type|
    watch(%r{
          (?:app|vendor)
          (?:/assets/\w+/(?<path>[^.]+) # path+base without extension
           (?<ext>\.#{ext})) # matching extension (must be first encountered)
          (?:\.\w+|$) # other extensions
          }x) do |m|
      path = m[1]
      "/assets/#{path}.#{type}"
    end
  end

  # file needing a full reload of the page anyway
  watch(%r{app/views/.+\.(#{rails_view_exts * '|'})$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{config/locales/.+\.yml})
end

guard 'migrate' do
  watch(%r{^db/migrate/(\d+).+\.rb})
  watch('db/seeds.rb')
end

# guard 'process', name: 'Postgresq container', command: 'docker run' do
#   watch('Gemfile.lock')
# end

guard 'puma', port: 3000 do
  watch('Gemfile.lock')
  watch(%r{^config|lib|api/.*})
end

# Using a testing Guard plugin such as guard-rspec together with guard-rubocop in the TDD way (the red-green-refactor
# cycle), might be uncomfortable with the offense reports from RuboCop in the red-green phase:
#
#   * In the red-green phase, you're not necessarily required to write clean code - you just focus writing code to pass
#     the test. It means, in this phase, guard-rspec should be run but guard-rubocop should not.
#   * In the refactor phase, you're required to make the code clean while keeping the test passing. In this phase, both
#     guard-rspec and guard-rubocop should be run.

group :red_green_refactor, halt_on_fail: true do
  # Note: The cmd option is now required due to the increasing number of ways
  #       rspec may be run, below are examples of the most common uses.
  #  * bundler: 'bundle exec rspec'
  #  * bundler binstubs: 'bin/rspec'
  #  * spring: 'bin/rspec' (This will use spring if running and you have
  #                          installed the spring binstubs per the docs)
  #  * zeus: 'zeus rspec' (requires the server to be started separately)
  #  * 'just' rspec: 'rspec'

  guard :rspec, cmd: 'bundle exec rspec' do
    require 'guard/rspec/dsl'
    dsl = Guard::RSpec::Dsl.new(self)

    # Feel free to open issues for suggestions and improvements

    # RSpec files
    rspec = dsl.rspec
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.spec_support) { rspec.spec_dir }
    watch(rspec.spec_files)

    # Ruby files
    ruby = dsl.ruby
    dsl.watch_spec_files_for(ruby.lib_files)

    # Rails files
    rails = dsl.rails(view_extensions: %w[erb haml slim])
    dsl.watch_spec_files_for(rails.app_files)
    dsl.watch_spec_files_for(rails.views)

    watch(rails.controllers) do |m|
      [
        rspec.spec.call("routing/#{m[1]}_routing"),
        rspec.spec.call("controllers/#{m[1]}_controller"),
        rspec.spec.call("acceptance/#{m[1]}")
      ]
    end

    # Rails config changes
    watch(rails.spec_helper)     { rspec.spec_dir }
    watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
    watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

    # Capybara features specs
    watch(rails.view_dirs)     { |m| rspec.spec.call("features/#{m[1]}") }
    watch(rails.layouts)       { |m| rspec.spec.call("features/#{m[1]}") }

    # Turnip features and steps
    watch(%r{^spec/acceptance/(.+)\.feature$})
    watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
      Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance'
    end
  end

  guard :rubocop, cli: '-a' do
    watch('Gemfile')
    watch(/.+\.rb$/)
    watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
  end
end
