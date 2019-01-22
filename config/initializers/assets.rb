# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('assets', 'images', 'fallback')
Rails.application.config.assets.paths << Rails.root.join('assets', 'images', 'banners')
Rails.application.config.assets.paths << Rails.root.join('vendor')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'css')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'audio')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'fonts')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'author')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'banner')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'blog')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'cart')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'flag')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'flex')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'icon-img')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'logo')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'post')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'product')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'slider')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'team')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'img', 'thum-2')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'js')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'js', 'vendor')
Rails.application.config.assets.precompile += %w( chartkick.js )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
 Rails.application.config.assets.precompile += %w( *.jpg *.png *.jpeg)
