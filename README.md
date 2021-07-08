# Bitmap editor

### Background

A Ruby 2.3 program that simulates a basic interactive bitmap editor. Bitmaps are represented as an M x N matrix of pixels with each element representing a colour.

## Commands

There are 6 supported commands:

- `I N M` - Create a new M x N image with all pixels coloured white (O).
- `C` - Clears the table, setting all pixels to white (O).
- `L X Y C` - Colours the pixel (X,Y) with colour C.
- `V X Y1 Y2 C` - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
- `H X1 X2 Y C` - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
- `S` - Show the contents of the current image

Command reference files can be found in `examples/valid` folder.

## Prerequisites

- `ruby 2.3.4` (Can be downloaded from https://www.ruby-lang.org/en/downloads/ or with RVM https://rvm.io/)
- `bundler` (run `gem install bundler` to get the latest version of bundler)

## Running:

`>bin/bitmap_editor examples/show.txt`

## Running tests:
- `bundle exec rspec`
- Run tests in verbose mode (with group and example names): `bundle exec rspec -f d`
