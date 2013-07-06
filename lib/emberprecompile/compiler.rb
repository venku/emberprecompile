require 'find'
require 'barber'
require 'fileutils'

module Emberprecompile
    class Compiler
        def self.compile
            source = SETTINGS["handlebars_dir"]
            file_ext = SETTINGS["handlebars_ext"]

            # Iterating through all files under source to identify
            Find.find(source) do |file|
                self.compileFile(file)
            end

            print "\n"
            self.combine
            print "Pre-Compiled handlebars are ready for use....\n-------------------------------------------------------\n"
        end

        def self.combine
            cache_source = SETTINGS["_cache"]
            file_ext = SETTINGS["handlebars_ext"] + ".cache"
            output_dir = SETTINGS["output_dir"]

            if(output_dir.rindex("/") == output_dir.length-1)
                output_dir[output_dir.length - 1] = ""
            end

            if( !File.directory?(SETTINGS["output_dir"]) )
                FileUtils.mkdir SETTINGS["output_dir"]
            end

            fileName = output_dir + "/" + SETTINGS["output_file"]
            output = File.new(fileName, "w")
            
            # Iterating through each file and writing to output file
            Find.find(cache_source) do |file|
                if !FileTest.directory?(file)
                    if(file.end_with?(file_ext))
                        output.write(File.read(file))
                    end
                end
            end
            output.close()
        end

        def self.compileFile(file)
            source = SETTINGS["handlebars_dir"]
            file_ext = SETTINGS["handlebars_ext"]

            if !FileTest.directory?(file)
                if(file.end_with?(file_ext))
                    print "Compiling "+file

                    # Extracting Template Name from file name
                    templateName = file.chomp(file_ext)
                    templateName.slice!(source)

                    # Creating a temporary file for the handlebar to save output
                    tempFile_Name = SETTINGS["_cache"] + templateName.slice(0, templateName.rindex("/"))
                    FileUtils.makedirs(tempFile_Name)
                    tempFile_Name = SETTINGS["_cache"] + templateName + file_ext + ".cache"
                    tempFile = File.new(tempFile_Name, "w")

                    if(templateName.index("/") == 0)
                        templateName[0] = ""
                    end
                    # Compiling Handlebar using Barber plugin
                    result = Barber::Ember::FilePrecompiler.call(File.read(file))

                    # Writing output to temporary file
                    tempFile.write('/* '+ templateName + ' Handlebar */')
                    tempFile.write('Ember.TEMPLATES["' + templateName + '"] = ' + result + "\n")

                    tempFile.close()
                    print "\n"
                end
            end
        end

        def self.deleteFile(file)
            source = SETTINGS["handlebars_dir"]
            cache_source = SETTINGS["_cache"]
            folder = false

            if FileTest.directory?(file)
                folder = true
            end

            if(source.rindex("/") == source.length-1)
                source[source.length - 1] = ""
            end

            file.slice!(source)
            cache_file = cache_source + file
            if folder
                FileUtils.remove_dir(cache_file)
            else
                cache_file = cache_file + ".cache"
                if File.exists?(cache_file)
                    FileUtils.rm(cache_file)
                end
            end
        end

    end
end