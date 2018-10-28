# AAA. Be sure to restart your server when you modify this file.

# Everything
$APP = {
  :name        => 'GCE Region/MachineTypes',
  :headline    => 'This app shows all machine-types available by region using public GCE APIs',
  :history     => File.open("#{Rails.root}/HISTORY" ).read ,  # RAILS_ROOT
  :version     => File.open("#{Rails.root}/VERSION" ).read.strip ,  # RAILS_ROOT
  :copyright   => 'Copyright 2018-18 A few rights reserved (see LICENSE)',
  :email       => 'riccardo.carle' + 'sso+gceregions@gmail.com',
  :author_name => 'Riccardo Carlesso',
  :is_template => false, # change to false
}

$APP[:license] = File.open("#{Rails.root}/LICENSE" ).read rescue "No /LICENSE file found. Please add it to the root directory and Ill load it automatically for you ;)"
$APP[:author] = "#{$APP[:author_name]} <#{$APP[:email]}>"

# Synctactic sugar
$app_name = $APP[:name]
# filtering out verbose/multiline stuff.
$app = $APP.select { |key, value| ! key.to_s.match(/license|history/) }