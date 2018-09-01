# Template orders

Installing a front-end template on a rails app.

The commits show all the steps I took.

## How to

For each css and js resources we will have to:
  1. Add them in the assets folder/< type of the file >
  2. Reference them *properly* in the html file
  3. Reference them in the assets.rb file

As for the images, it is simpler, the `image_tag` helper does the job. The files need to be placed in assets/images.

The fonts are less obvious because they don't generate any browser error. They are referenced in a css file. The path to each font needs to be updated.

## General tips

Which css files do I need to add? Lookup the stylesheet tags in the html file.

Which js files do I need to add? Those that provoke errors in your browser console. Otherwise lookup the scrip tags in your html file.

As for the fonts and the images, the rails log will display some errors.

There are fonts URLs in the css files, they will need to be modified (I used the `asset-path` helper, available in `.scss` files).

`ls -1` displays the list of files in one column, easy to copy paste.

If your assets are delivered correctly locally but fail to compile on Heroku, try `RAILS_ENV=production rails assets:precompile` to catch the error in your console logs.

Good luck