# frozen_string_literal: true

module Mk
  class CLI
    def call(args)
      if args.length < 2
        puts "Usage: mk <template_name> <project_name>"
        return 1
      end

      template_name = args[0]
      folder_name = args[1]
      project_name = folder_name.sub(/\..*\z/, "")
      constant_name = project_name.downcase.split(/[-_]/).map(&:capitalize).join

      template_path = File.expand_path("~/templates/#{template_name}")
      unless Dir.exist?(template_path)
        puts "Template not found: #{template_path}"
        return 1
      end

      system("cp", "-r", template_path, "./#{folder_name}")

      replace_in_files(folder_name, project_name, constant_name)
      rename_files(folder_name, project_name, constant_name)

      puts "Created #{folder_name} from #{template_name} template"
      0
    end

    private

    def replace_in_files(folder_name, project_name, constant_name)
      Dir.glob("#{folder_name}/**/*", File::FNM_DOTMATCH).lazy
        .reject { |path| File.directory?(path) }
        .each do |file_path|
          content = File.read(file_path)
          updated_content = content
            .gsub("ExampleGem", constant_name)
            .gsub("examplegem", project_name)

          File.write(file_path, updated_content)
        end
    end

    def rename_files(folder_name, project_name, constant_name)
      loop do
        found_file = Dir.glob("#{folder_name}/**/*", File::FNM_DOTMATCH)
          .lazy
          .select { |path| path.match?(/examplegem|ExampleGem/) }
          .first

        if found_file
          new_path = found_file
            .gsub("ExampleGem", constant_name)
            .gsub("examplegem", project_name)

          File.rename(found_file, new_path)
        else
          break
        end
      end
    end
  end
end
