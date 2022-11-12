# image2asciiart
Script converts image to ascii art written in Nim.

## dependencies

- Nim
- [pixie](https://github.com/treeform/pixie)

## Usage

```
$ nim c image2asciiart
$ ./image2asciiart filename.png
```

You can pass the following options:

- `--width` (or `-w`): specify the width of ascii art
- `--height` (or `-h`): specify the height of ascii art

With options, you can execute the program as follows:

```
$ ./image2asciiart -w:40 -h:40 filename.png 
```

## Note
I refered [this program](https://github.com/private-yusuke/video2asciis/blob/master/v2t.py#L25) to define `chars`.

## License
MIT
