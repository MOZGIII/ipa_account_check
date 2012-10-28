require "ipa_account_check/version"
require "zip/zip"

module IpaAccountCheck
  METADATA_FILENAME = "iTunesMetadata.plist"
  
  def self.proccess(file)
    unless File.file?(file)
      puts "No such file - #{file}"
      return
    end
    
    xml = extract_metadata(file)
    account = fetch_account_from_xml(xml)
    puts "#{file} | #{account}"
  end
  
  def self.fetch_account_from_xml(xml)
    # Format:
    # 	<key>appleId</key>
    #   <string>steve@rim.jobs</string>
    regexp = /<key>appleId<\/key>\s*<string>([^>]*)<\/string>/im
    xml.match(regexp)[1]
  end
  
  def self.extract_metadata(filename)
    Zip::ZipFile.open(filename) do |zipfile|
      zipfile.read(METADATA_FILENAME)
    end
  end
end
