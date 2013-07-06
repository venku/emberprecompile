require 'rubygems'
require 'fssm'

module Emberprecompile
    class Watcher
        def self.watch
            source = SETTINGS["handlebars_dir"]

            if !File.directory?(SETTINGS["_cache"])
                Emberprecompile::Compiler.compile
            end

            print "Monitoring for changes in handlebar files in '" + SETTINGS["handlebars_dir"] + "' folder. Press Ctrl + C to stop it."

            FSSM.monitor(source) do 
                update do |b, r|
                    print "Change detected in >>>> " + r + "\n     >>> "
                    path_update = Emberprecompile::Watcher.getfilepath(b, r)
                    Emberprecompile::Compiler.compileFile(path_update)
                    Emberprecompile::Compiler.combine
                    print "\n"
                end
                
                create do |b, r|
                    print "Created >>>> " + r + "\n     >>>>>> "
                    path_update = Emberprecompile::Watcher.getfilepath(b, r)
                    Emberprecompile::Compiler.compileFile(path_update)
                    Emberprecompile::Compiler.combine
                    print "\n"
                end
                
                delete do |b, r|
                    print "Deleted >>>> " + r + "\n"
                    path_update = Emberprecompile::Watcher.getfilepath(b, r)
                    Emberprecompile::Compiler.deleteFile(path_update)
                    Emberprecompile::Compiler.combine
                    print "\n"
                end
            end
        end

        def self.getfilepath(working_path, file_path)
            working_dir = Dir.pwd
            working_path.slice!(working_dir)
            if(working_path.index("/") == 0)
                working_path[0] = ""
            end
            return working_path + "/" + file_path
        end

    end
end
