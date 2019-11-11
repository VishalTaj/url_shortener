module RailsConfig
  class Options < OpenStruct
    #=> Error Handler
    PathNotFound = Class.new(StandardError)
    
    attr_accessor :settings
    def self.load_path
      settings_path = Rails.root.join('config', 'settings.yml')
      raise(PathNotFound, "'settings.yml' file is missing please add it inside 'config/'") unless settings_path.exist?
      env_path = Rails.root.join('config', 'settings', "#{Rails.env}.yml")
      raise(PathNotFound, "'#{Rails.env}.yml' file is missing please add it inside 'config/settings/'") unless env_path.exist?
      settings_hash = YAML.load_file(settings_path) || {}
      env_hash = YAML.load_file(env_path) || {}
      return self.new(settings_hash.merge(env_hash))
    end
  end
end

Settings = RailsConfig::Options.load_path.freeze