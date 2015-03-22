require 'csv'
require './gems/prawn/lib/prawn'

csv_text = File.read('./data.csv')
csv = CSV.parse(csv_text, :headers => true)

csv.each_with_index do |row, index|

  p "Creating pdf for row ##{index}"

  pdf = Prawn::Document.new do
    font 'helveticabold.ttf'
    text row['FIRSTNAME'], :size => 25, :align => :center
    move_down(3)
    # font 'Helvetica.dfont'
    # text submitter.name.titleize, :size => 13, :align => :center
    # move_down(3)
    # text submitter.email, :size => 13, :align => :center
    # move_down(3)
    # text submitter.phone_num, :size => 13, :align => :center

    # move_down(10)
    # font 'helveticabold.ttf'
    # text "LOCATION", :size => 12
    # move_down(10)
    # font "Helvetica.dfont"
    # text submitter.location, :size => 11

    # move_down(14)
    # font 'helveticabold.ttf'
    # text "PROJECT DESCRIPTION", :size => 12
    # move_down(10)
    # font "Helvetica.dfont"
    # text submitter.project_description, :size => 11

    # move_down(14)
    # font 'helveticabold.ttf'
    # text "OTHER TEAM MEMBERS", :size => 12
    # move_down(10)
    # font "Helvetica.dfont"
    # text submitter.other_team_members, :size => 11

    # move_down(14)
    # font 'helveticabold.ttf'
    # text "CATEGORY", :size => 12
    # move_down(10)
    # font "Helvetica.dfont"
    # text submitter.category, :size => 11

    # move_down(14)
    # font 'helveticabold.ttf'
    # text "VIDEO URL", :size => 12
    # move_down(10)
    # font "Helvetica.dfont"
    # text submitter.video_url, :size => 11

    # move_down(14)
    # font 'helveticabold.ttf'
    # text "IMAGE", :size => 12
    # move_down(10)
    # unless submitter.image.file.nil?
    #   image submitter.image.file.file, :height => 300
    # else
    #   font "Helvetica.dfont"
    #   text "(none)", :size => 11
    # end
  end

  # can also include full path, if not, will create pdf in the same directory as this script
  filename = "#{index}.pdf"
  pdf.render_file filename
end