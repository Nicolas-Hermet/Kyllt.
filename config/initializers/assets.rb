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
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( js/jquery.min.js )
Rails.application.config.assets.precompile += %w( js/popper.min.js )
Rails.application.config.assets.precompile += %w( js/bootstrap.js )
Rails.application.config.assets.precompile += %w( js/plugins.js )
Rails.application.config.assets.precompile += %w( js/loaders.css.js )
Rails.application.config.assets.precompile += %w( js/stickyfill.min.js )
Rails.application.config.assets.precompile += %w( js/remodal.js )
Rails.application.config.assets.precompile += %w( js/rellax.min.js )
Rails.application.config.assets.precompile += %w( js/theme.js )
Rails.application.config.assets.precompile += %w( loaders.min.css )
Rails.application.config.assets.precompile += %w( remodal.css )
Rails.application.config.assets.precompile += %w( remodal-default-theme.css )
Rails.application.config.assets.precompile += %w( theme.css )
