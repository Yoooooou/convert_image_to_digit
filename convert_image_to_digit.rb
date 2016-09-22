require 'RMagick'
include Magick

source_dir = ''
destination_dir = ''

def convert file
  File.open('source_dir/' + file, 'w') do |f|
    image = ImageList.new('destination_dir/' + file)
    (0..image.rows).each do |x|
      (0..image.columns).each do |y|
        pixel = image.pixel_color(y, x)
        if (pixel.red & 255) >= 300 or (pixel.green & 255) >= 200 or (pixel.blue & 255) >= 200
          f.write '0'
        else
          f.write '1'
        end
      end
      f.write "\n"
    end
  end
end
