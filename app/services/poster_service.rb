require 'FileUtils'
require 'zip'
require 'nokogiri'

class PosterService
  attr_reader :first_name, :last_name
  def initialize(candidate)
    @first_name = candidate.first_name
    @last_name = candidate.last_name
    @profession = candidate.profession
    @district = candidate.district
  end

  def create
    dir = Rails.root.join('data')
    # copy(dir)
    modify(dir)
  end

  private

  # def copy(dir)
  #   dir = Rails.root.join('data')
  #   FileUtils.copy_entry "#{dir}/template", "#{dir}/#{first_name}-#{last_name}"
  # end

  def modify(dir)
    file = File.open("#{dir}/#{first_name}-#{last_name}/Stories/Story_u3e6.xml")
    xml = Nokogiri::XML(file)

    xml.xpath("////Content").each do |node|
      node.content = first_name
    end

    File.write(file, xml.to_xml)
  end

end