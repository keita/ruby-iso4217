$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "lib")
$LOADED_FEATURES << "iso4217/code.rb"
require "iso4217"
require "csv"
require "fileutils"

desc "Make lib/iso4217/code.rb"
task :code do
  reader = CSV::IOReader.new(File.open("iso4217.csv"))
  reader.shift
  table = Hash.new
  reader.each do |line|
    location, currency, code, num, ccc, obsolete = line
    if table.key?(code)
      table[code].locations << location
    else
      table[code] = ISO4217::Code.new(:code => code,
                                      :num => num,
                                      :locations => [location],
                                      :currency => currency,
                                      :ccc => !ccc.nil?,
                                      :obsolete => obsolete)
    end
  end
  # make directory
  FileUtils.mkdir_p "lib/iso4217"

  # open file
  file = File.open("lib/iso4217/code.rb", "w")

  # start module
  file.puts "module ISO4217"

  # codes
  table.keys.sort.each do |key|
    locations = table[key].locations
    ccc = table[key].ccc ? "true" : "false"
    obsolete = table[key].instance_variable_get("@obsolete")

    # define
    file.puts <<__RB__
  CODE["#{key}"] = ISO4217::Code.new(
    :code => "#{table[key].code}",
    :num => #{table[key].num || "nil"},
    :locations => #{locations.inspect},
    :currency => "#{table[key].currency}",
    :ccc => #{ccc},
    :obsolete => #{obsolete.inspect}
  )
__RB__
  end

  # make consts
  table.keys.sort.each do |key|
    file.puts <<__RB__
  #{key} = CODE["#{key}"]
__RB__
  end

  # end module
  file.puts "end"
end
