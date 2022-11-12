import pixie

proc image2asciiart(filename: string): seq[string] =
  let image = readImage(filename)
  
