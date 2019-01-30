require 'FileUtils'
require 'zip'
require 'nokogiri'
# require 'zip/zip'
# require 'zip/zipfilesystem'

class PosterService
  
  attr_reader :first_name, :last_name, :profession, :district, :first_name_dep, :last_name_dep 
  
  def initialize(candidate)
    @first_name = candidate.first_name
    @last_name = candidate.last_name
    @profession = candidate.profession
    @district = candidate.district
    @first_name_dep = candidate.deputy.first_name
    @last_name_dep = candidate.deputy.last_name
  end

  def create
    dir = Rails.root.join('data')
    folder = "#{first_name}-#{last_name}" 
    copy(dir, folder) unless File.exist?("#{dir}/#{folder}")
    xml("#{dir}/#{folder}/Stories", xmls(dir))
    compress(dir, "#{dir}/#{folder}")
    remove("#{dir}/#{folder}")
  end

  private

  def copy(dir, folder)
    FileUtils.copy_entry("#{dir}/template","#{dir}/#{folder}")
  end

  def xml(xml_path, xml_list)
    xml_list.each do |xml_tag, xml_array|
      xml_array.each do |xml_file|
        modify_xml(xml_path, xml_tag, xml_file)
      end
    end
  end

  def modify_xml(xml_path, xml_tag, xml_file)  
    file = File.open("#{xml_path}/#{xml_file}")
    xml = Nokogiri::XML(file)

    xml.xpath("////Content").each do |node|
      node.content = send("#{xml_tag}")
    end
    save_xml(file, xml)
  end

  def save_xml(file, xml)
    File.write(file, xml.to_xml)
  end

  def xmls(dir)
    YAML.load(open("#{dir}/stories.yml").read)
  end

  def compress(dir, path)
    path.sub!(%r[/$],'')
    archive = File.join(dir,File.basename(path))+'.idml'
    FileUtils.rm archive, :force=>true

    Zip::File.open(archive, 'w') do |zipfile|
      Dir["#{path}/**/**"].reject{|f|f==archive}.each do |file|
        zipfile.add(file.sub(path+'/',''),file)
      end
    end
  end

  def remove(path)
    FileUtils.remove_entry("#{path}", force = false)
  end

end