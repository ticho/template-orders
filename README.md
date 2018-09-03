# Installing a front-end template on a rails app


The commits show all the steps I took.

Your can see the Inspinia template installed on a page [here](https://radiant-sea-74712.herokuapp.com/).

## Index
  1. [How to](#how-to)
  2. [Commits](#commits)
  3. [General tips](#general-tips)

## How to

First copy the HTML file in your app and add the `.erb` extension.
```sh
app
├── ... 
└── views
    ├── home
    |    └── index.html.erb
    └── layouts
```
Then, for each css and js resources we will have to:
  1. Add them in the `app/assets/< type of the file >` folder

  ``` sh
app
├── assets
│   ├── config
│   ├── images
│   ├── javascripts
|   |   .
│   │   └── inspinia.js
│   └── stylesheets
│       .
│       └── animate.css
  ```
  2. Reference them *properly* in the `html.erb` file, using either `stylesheet_link_tag` or `javascript_include_tag`

  ``` erb
    <%# index.html.erb %>
    <html>
    <head>
      <%= stylesheet_link_tag 'animate.css' %>
    </head>
    <body>
      <% javascript_include_tag 'inspinia.js' %>
    </body>
    </html>
  ```
  3. Reference them in the `config/initializers/assets.rb` file

  ``` ruby
  # config/initializers/assets.rb
  Rails.application.config.assets.precompile += %w(
    animate.css
    inspinia.js 
  )
  ```

As for the images, it is simpler, the `image_tag` helper does the job. The files need to be placed in assets/images.

The fonts are less obvious because they don't generate any browser error. They are referenced in a css file. The path to each font needs to be updated.

```scss
/* font-awesome.css.scss */
@font-face {
  font-family: 'FontAwesome';
  src: url(asset-path('inspinia/fonts/fontawesome-webfont3e6e.eot?v=4.7.0'));
  ...
}
```

## Commits
You can see the steps I took to install the template by following the commits.

1. [Installing the css](https://github.com/ticho/template-orders/commit/3f0fd7fcb01a6f36d564cd9bc10a8d83aef5d1fa)
    - [assets.rb](https://github.com/ticho/template-orders/commit/3f0fd7fcb01a6f36d564cd9bc10a8d83aef5d1fa#diff-05c836ce3d55f791a34c33cac08ccd1a)
    - [index.html.erb](https://github.com/ticho/template-orders/commit/3f0fd7fcb01a6f36d564cd9bc10a8d83aef5d1fa#diff-d9db7f7cb7dcd9bbe759b990b685bdda)
2. [Installing the js files](https://github.com/ticho/template-orders/commit/3f0fd7fcb01a6f36d564cd9bc10a8d83aef5d1fa)
    - [assets.rb](https://github.com/ticho/template-orders/commit/158ca9891118d93bde1007fd5d266d23c30e27fd#diff-05c836ce3d55f791a34c33cac08ccd1a)
    - [application.js](https://github.com/ticho/template-orders/commit/158ca9891118d93bde1007fd5d266d23c30e27fd#diff-a9c3bd311eab80c9ebe6a69830f9ad02)
    - [index.html.erb](https://github.com/ticho/template-orders/commit/158ca9891118d93bde1007fd5d266d23c30e27fd#diff-d9db7f7cb7dcd9bbe759b990b685bdda)
3. [Added Fontawesome](https://github.com/ticho/template-orders/commit/3f0fd7fcb01a6f36d564cd9bc10a8d83aef5d1fa)
    - [scss file](https://github.com/ticho/template-orders/commit/23fcb6828b0600b311b747bb03bd7e5d3acf459a#diff-65a38f57a96bc9eb32febac3240856fb)
4. [Added footable fonts](https://github.com/ticho/template-orders/commit/8c10d053e37ffbf2f8ad5dcfbf95ee05bd4ddbf5)
    - [scss file](https://github.com/ticho/template-orders/commit/8c10d053e37ffbf2f8ad5dcfbf95ee05bd4ddbf5#diff-80a793135a769783ec08249407f8c75e)

## General tips

### How do I know which css files do I need to add?
Lookup the stylesheet tags in the html file.
```html
  <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
```

### How do I know which js files do I need to add?
They will be requested by the browser but not found and thus they will display errors in your browser console. Otherwise lookup the scrip tags in your html file.
```html
  <script src="js/inspinia.js"></script>
```


### Fonts and images
The rails console log will display some errors.

There are fonts URLs in the css files, they will need to be modified (I used the `asset-path` helper, available for <strong>`.scss`</strong> files).

### Others

- The jquery file needs to be required in `application.js`.

- `ls -1` displays the list of files in one column, easy to copy paste.

- If your assets are delivered correctly locally but fail to compile on Heroku, try to catch the error in your console logs with :
```sh
RAILS_ENV=production rails assets:precompile
```
  

- If you put your assets in folders, don't forget to modify the path to those assets in the rails helpers and in `assets.rb`

- :warning: Don't forget to restart your server when you modify `assets.rb` (as stated [here](https://github.com/ticho/template-orders/commit/694449ff553162d030dc6adb7fe5b4734e1ecf21#diff-05c836ce3d55f791a34c33cac08ccd1aR1)).

Good luck