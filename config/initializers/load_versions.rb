raw = File.read(Rails.root + "config/versions.yml")
versions = YAML.load(raw)
APP_VERSION = versions.keys.sort.last
