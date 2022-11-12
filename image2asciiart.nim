import pixie
import sequtils

const
  chars = ['@', 'W', '#', 'R', 'E', '8', 'x', 's', 'i', ';', ',', '.', ' ']

proc getGrayscalePixel(pixel: ColorRGBX): int =
  result = (pixel.r + pixel.g + pixel.b) / 3

proc getChar(pixel: int): char =
  let width = 256 / chars.len + 1  # +1 to avoid index error
  result = chars[pixel / width]

proc image2asciiart(filename: string): seq[string] =
  let
    image = readImage(filename)
    grayscalePixel = image.data.map(getGrayscalePixel)
    asciiArt = grayscalePixel.map(getChar)
  for i in 0..<asciiArt.len:
    stdout.write asciiArt[i]
    if i mod image.width == image.width-1:
      echo ""
  
