module TestAppTemplateData
  def replace_tag(file_name)
    file = File.open("#{Rails.root}/public/#{file_name}", "rb")
    contents = file.read      
    contents = create_loop(contents, contents.scan(/(<!--\s(.*)-->)+([^\[]+)(<!-- end repeat -->)+/))
    dynamic_content = contents.scan(/\{\w+}/).flatten
    dynamic_content.each do |content|
      replace_content = content.delete("{}")
      original_content = eval(replace_content)
      contents = contents.gsub(content, original_content)
    end
    contents
  end

  def create_loop(contents, static_content)
    loop_replace = ""
    static_content.each do |first_loop|
      @proposal.proposal_sections.each_with_index do |proposal_section, index|
        replace_content = replace_curly_braces(first_loop[2], index)
        loop_replace += replace_content
      end
      replace_string = (first_loop[0] + first_loop[2] + first_loop[3])
      contents = contents.gsub(replace_string, loop_replace)
    end
    
    contents
  end

  def replace_curly_braces(contents, id = 0)
    dynamic_content = contents.scan(/\{\w+}/).flatten
    dynamic_content.each do |content|
      replace_content = content.delete("{}")
      original_content = eval(replace_content+"(#{id})")
      contents = contents.gsub(content, original_content)
    end
    contents
  end

end