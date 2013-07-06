require 'rubygems'
require 'fssm'
require 'find'

module Emberprecompile
    class Config
    	def self.setting
            fileName = "emberprecompile-config.rb"
            settings = Hash.new

            # Config file does not exist, So create a new file.
            if(!File.exists?(fileName))
                file = File.new(fileName, "w")
                file.write("# Settings file to change the paths of handlebars \n# and compiled version of handlebars files \n\n")
                file.write('handlebars_dir = "views"'+" # Path to Handlebars files \n")
                file.write('handlebars_ext = ".handlebars"'+" # Handlebar files extension \n")
                file.write('output_dir = "compiled"'+" # Path to compiled Handlebars output \n")
                file.write('output_file = "views.handlebars.js"'+" # File name of output \n")
                file.close()
            end

            # Read config settings from file.
            file = File.read(fileName)
            file.each_line do |line|
                if(line.match(/^#/))
                    next
                elsif(line.match(/^$/))
                    next
                else
                    if(line["#"] != nil)
                        temp = line.strip.split("#")
                        line = temp.first.to_s.strip
                    end
                    if(line["="] != nil)
                        temp = line.strip.split("=")
                        settings[temp.first.to_s.strip] = temp.last.to_s.strip.tr('"', "")
                    end
                end
            end
            settings["_cache"] = "._cache"
            return settings
        end
    end
end