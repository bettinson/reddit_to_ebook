module GenerateMobi
  def self.generate(file)
    file_basename = File.basename(file)
    converted_name = file_basename.gsub(/ /, '\ ')

    if (File.exists?("#{converted_name}.mobi"))
      return File.open("./#{File.basename(file, '.html')}.mobi")
    end

    unless (File.exists?("#{converted_name}.mobi"))
      system("./kindlegen #{file_basename.gsub(/ /, '\ ')}")
    end

    kindle_file = File.open("./#{File.basename(file, '.html')}.mobi")
    kindle_file
  end
end