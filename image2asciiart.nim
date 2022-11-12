import pixie
import sequtils

const
  chars = ['@', 'W', '#', 'R', 'E', '8', 'x', 's', 'i', ';', ',', '.', ' ']

proc getGrayscalePixel(pixel: ColorRGBX): int =
  result = (pixel.r + pixel.g + pixel.b) / 3

proc image2asciiart(filename: string): seq[string] =
  let
    image = readImage(filename)
    grayscalePixel = image.data.map(getGrayscalePixel)
  
