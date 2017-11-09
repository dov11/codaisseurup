source 'https://rubygems.org'
ruby '2.3.1'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails', '~> 4.3.1'
gem 'devise', '~> 4.2'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'carrierwave', '0.11.2'
gem 'cloudinary', '1.2.3'

gem 'rails_12factor', group: :production
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_girl_rails', '4.7.0'
  gem 'faker', '1.6.6'
  gem 'shoulda-matchers'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '~> 2.9', '>= 2.9.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
