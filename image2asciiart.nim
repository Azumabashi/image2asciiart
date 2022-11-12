import pixie
import sequtils
import math

const
  chars = ['@', 'W', '#', 'R', 'E', '8', 'x', 's', 'i', ';', ',', '.', ' ']

proc getGrayscalePixel(pixel: ColorRGBX): int =
  result = int(int(pixel.r + pixel.g + pixel.b) / 3)

proc getChar(pixel: int): char =
  let width = int(256 / chars.len) + 1  # +1 to avoid index error
  result = chars[int(floor(pixel / width))]

proc image2asciiart*(filename: string, width: int, height: int): seq[string] =
  let
    image = readImage(filename).resize(width, height)
    grayscalePixel = image.data.map(getGrayscalePixel)
    asciiArt = grayscalePixel.map(getChar)
  for i in 0..<asciiArt.len:
    stdout.write asciiArt[i]
    if i mod image.width == image.width-1:
      echo ""

