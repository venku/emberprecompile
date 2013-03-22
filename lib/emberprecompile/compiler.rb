require 'find'
require 'barber'

module Emberprecompile
    class Compiler
        def self.compile
            fileName = "compiled/views.handlebars.js"
            source = "views/"
            output = File.new(fileName, "w")
            
            Find.find(source) do |file|
                if !FileTest.directory?(file)
                    if(file.end_with?(".handlebars"))
                        print "Compiling "+file
                        templateName = file.chomp(".handlebars")
                        templateName.slice!(source)
                        result = Barber::Ember::FilePrecompiler.call(File.read(file))
                        output.write('/* '+ templateName + ' Handlebar */')
                        output.write('Ember.TEMPLATES["' + templateName + '"] = ' + result + '')
                        print "\n"
                    end
                end
            end
            print "\n"
            print "Pre-Compiled handlebars are ready for use....\n-------------------------------------------------------\n"
        end
    end
end