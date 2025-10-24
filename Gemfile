# Source principale
source "https://rubygems.org"

# ----------------------------------------
# ⚙️ Framework principal
gem "rails", "~> 8.0.3"

# ----------------------------------------
# 🗄️ Base de données
gem "pg", "~> 1.1"
gem "ransack", "~> 4.2"
gem "pagy", "~> 9.0"
gem "state_machines-activerecord", "~> 0.9.0"

# ----------------------------------------
# 🚀 Serveur & Performance
gem "puma", ">= 5.0"
gem "bootsnap", require: false

# ----------------------------------------
# 🎨 Front-end & Assets
gem "propshaft"
gem "jsbundling-rails"
gem "tailwindcss-rails"
gem "tailwindcss-ruby", "~> 4.1"
gem "lucide-rails", "~> 0.7.1"

# ----------------------------------------
# 🧱 Vues & Composants
gem "haml-rails"
gem "simple_form"
gem "view_component"

# ----------------------------------------
# 🔐 Authentification
gem "devise", "~> 4.9"

# ----------------------------------------
# ⚡ Hotwire / Turbo
gem "turbo-rails", "~> 2.0"

# ----------------------------------------
# 🧵 Background Jobs & Caching (Solid suite)
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# ----------------------------------------
# 🛰️ Déploiement & Outils externes
gem "kamal", require: false
gem "thruster", require: false
# ----------------------------------------
# 🪟 Compatibilité Windows / JRuby
gem "tzinfo-data", platforms: %i[windows jruby]

# ----------------------------------------
# 🧰 Développement & Test
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  gem "html2haml" # utile pour convertir ERB vers HAML
end

# ----------------------------------------
# 🧠 Parsing
gem "ruby_parser", "~> 3.21"
