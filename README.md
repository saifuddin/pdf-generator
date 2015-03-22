PG-2-JSON-2-PDF Generator
==
___
Introduction
--

This is a simple Postgres to JSON to PDF Generator. It contains two scripts `pg2json.rb` and `json2pdf.rb`, each converting from a Postgres table to a JSON file, and from a JSON file to PDF respectively.

Dependencies
--
These scripts expect the system to have atleast Ruby 1.8 installed. No need to install any other rubygems as the gems are already included and here.

PG2JSON
--
`pg2json.rb` converts a Postgres table to a JSON file. Things that needs to be done:
1. Edit `./database.yml` and change the `database`, `tablename` and `column_as_filename` values
2. Add `username` and/or `password` if applicable.

Then, just run:
> $ ruby pg2json.rb

The script will read the specified table, and output a `data.json`.

JSON2PDF
--
`json2pdf.rb` converts the `data.json` to PDF files.

> YOU NEED TO CUSTOMIZE `json2pdf.rb` TO SUIT YOUR OWN PDF GENERATION!

For a sample run, if you have the sample `data.json`, just run:
> $ ruby json2pdf.rb

For your own customization, you have to edit out inside this block:

``` ruby
Prawn::Document.new do
 # your customization here
end
```
How it works is similar to a word document; it has somekind of carrot that you can control.
The line `text row['name'], :size => 25, :align => :center` will render a text from column `name`. Change `name` to your specified column.
___
# LICENCE

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.