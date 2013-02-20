require 'rubygems'
require 'fssm'

module Emberprecompile
    class Watcher
        def self.watch
            source = "views/"
            FSSM.monitor(source) do 
                update do |b, r|
                    print "Change detected in >>>> " + r + "\n\n"
                    Emberprecompile::Compiler.compile
                end
                
                create do |b, r|
                    print "Created >>>> " + r + "\n\n"
                    Emberprecompile::Compiler.compile
                end
                
                delete do |b, r|
                    print "Deleted >>>> " + r + "\n\n"
                    Emberprecompile::Compiler.compile
                end
            end
        end
    end
end
