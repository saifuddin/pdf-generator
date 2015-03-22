require 'yaml'
require './gems/json/lib/json'
require './gems/prawn/lib/prawn'

configuration = YAML::load(IO.read('./database.yml'))
p "Reading ./data.json.."
json_text = File.read('./data.json')
rows = JSON.parse(json_text)

rows.each_with_index do |row, index|
  column_name = configuration['database']['column_as_filename']
  filename = row[column_name.gsub(/[^0-9A-Za-z]/, '')].downcase + ".pdf"
  p "Creating " + filename + "..."

  pdf = Prawn::Document.new do
    font 'helveticabold.ttf'
    text row['name'], :size => 25, :align => :center
    move_down(3)
    font 'Helvetica.dfont'
    text row['excerpt'], :size => 13, :align => :center
    move_down(3)
    text row['link'], :size => 13, :align => :center

    move_down(10)
    font 'helveticabold.ttf'
    text "DESCRIPTION", :size => 12
    move_down(10)
    font "Helvetica.dfont"
    text row['product'].gsub("<br>", ""), :size => 11
  end

  # can also include full path, if not, will create pdf in the same directory as this script
  pdf.render_file "./pdfs/" + filename
end