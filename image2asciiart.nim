import pixie
import sequtils
import math
import parseopt
import strutils

const
  chars = ['@', 'W', '#', 'R', 'E', '8', 'x', 's', 'i', ';', ',', '.', ' ']

proc getGrayscalePixel(pixel: ColorRGBX): int =
  result = int(int(pixel.r + pixel.g + pixel.b) / 3)

proc getChar(pixel: int): char =
  let width = int(256 / chars.len) + 1  # +1 to avoid index error
  result = chars[int(floor(pixel / width))]

proc image2asciiart*(image: Image): seq[char] =
  let
    grayscalePixel = image.data.map(getGrayscalePixel)
    asciiArt = grayscalePixel.map(getChar)
  return asciiArt

if isMainModule:
  var
    p = initOptParser()
    filename: string
    width = -1
    height = -1

  # parse options
  while true:
    p.next()
    case p.kind
    of cmdEnd:
      break
    of cmdShortOption, cmdLongOption:
      case p.key
      of "w", "width":
        width = p.val.parseInt
      of "h", "height":
        height = p.val.parseInt
      else:
        echo "unknown key " & p.key
    of cmdArgument:
      filename = p.key

  if filename.len == 0:
    echo "filename should be specified."
    exit(1)
  if not fileExists(filename):
    echo "file " & filename & " does not exist."
    exit(1)

  var image = readImage(filename)
  if height > 0 and width > 0:
    image = image.resize(width, height)

  let asciiArt = image.image2asciiart
  for i in 0..<asciiArt:
    stdout.write asciiArt[i]
    if i mod image.width == image.width - 1:
      echo ""  # print \n
