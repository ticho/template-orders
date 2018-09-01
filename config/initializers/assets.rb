# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w(
  inspinia/animate.css
  inspinia/bootstrap.min.css
  inspinia/datepicker3.css
  inspinia/font-awesome.css
  inspinia/footable.core.css
  inspinia/style.css
  inspinia/jquery-3.1.1.min.js
  inspinia/bootstrap.min.js
  inspinia/bootstrap-datepicker.js
  inspinia/footable.all.min.js
  inspinia/inspinia.js
  inspinia/jquery.metisMenu.js
  inspinia/jquery.slimscroll.min.js
  inspinia/pace.min.js
)
