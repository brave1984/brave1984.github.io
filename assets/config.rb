require 'compass/import-once/activate'
# Require any additional compass plugins here.
require 'autoprefixer-rails'
require "bootstrap"

# Set this to the root of your project when deployed:
http_path = "/assets"
css_dir = "stylesheets"
sass_dir = "sass"
images_dir = "images"
javascripts_dir = "javascripts"

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed
# output_style = :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false


# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

browserslist = [
  '>= 1%',
  'last 1 version',
  'not dead',
  'chrome >= 45',
  'firefox >= 38',
  'edge >= 12',
  'ie 10',
  'ios >= 9',
  'safari >= 9',
  'android >= 4.4',
  'opera >= 30'
]

on_stylesheet_saved do |file|
  css = File.read(file)
  map = file + '.map'

  if File.exists? map
    result = AutoprefixerRails.process(css,
      browsers: browserslist,
      from:     file,
      to:       file,
      map:    { prev: File.read(map), inline: false })
    File.open(file, 'w') { |io| io << result.css }
    File.open(map,  'w') { |io| io << result.map }
  else
    File.open(file, 'w') do |io|
      io << AutoprefixerRails.process(css, browsers: browserslist)
    end
  end
end
