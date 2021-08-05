# Plaintro
[![Gem Version](https://badge.fury.io/rb/plaintro.svg)](https://badge.fury.io/rb/plaintro)

Plaintro is a responsive Jekyll theme aimed at personal websites.

[Live Demo](https://xh5a5n6k6.github.io/plaintro/)

## Table of Contents
- [Features](#features)
- [Installation](#installation)
    - [Gem-based theme](#gem-based-theme)
    - [Github Pages](#github-pages)
- [Usage](#usage)
    - [Configuration](#configuration)
    - [Top Header Bar](#top-header-bar)
    - [Default Page](#default-page)
    - [Blog](#blog)
    - [Post](#post)
    - [Archive](#archive)
    - [Portfolio](#portfolio)
    - [Resume](#resume)
    - [Google Analytics](#google-analytics)
- [Contributing](#contributing)
- [Development](#development)
- [License](#license)

## Features
- [Normalize.css](https://github.com/necolas/normalize.css)
- [Font Awesome](https://fontawesome.com)
- [Google Analytics](https://analytics.google.com/analytics/web/)
- [Jekyll Feed](https://github.com/jekyll/jekyll-feed)
- [Jekyll Paginate](https://github.com/jekyll/jekyll-paginate)
- [Jekyll SEO Tag](https://github.com/jekyll/jekyll-seo-tag)
- Responsive web design
- Multiple layouts for different pages (see [Usage](#usage) for more details)
- Easy-to-use templates for adding a new project to the portfolio page

## Installation
There are two ways to use plaintro: Gem-based theme and Github Pages.

### Gem-based theme
1. Add this line to your Jekyll site's `Gemfile`:
    ```ruby
    gem "plaintro"
    ```
2. And add this line to your Jekyll site's `_config.yml`:
    ```yaml
    theme: plaintro
    ```
3. And then execute:
    ```
    $ bundle
    ```
4. Or install it yourself as:
    ```
    $ gem install plaintro
    ```

### Github Pages
Github Pages uses the [--safe flag](https://jekyllrb.com/docs/configuration/options/) to build jekyll websites, which disable custom plugins, caching to disk, and ignore symbolic links. Because of that constraint, you can either fork/clone the repo and customize the theme, or use [jekyll-remote-theme](https://github.com/benbalter/jekyll-remote-theme) instead.

To build Github Pages via [jekyll-remote-theme](https://github.com/benbalter/jekyll-remote-theme), follow the steps below:
1. Add these lines to your Jekyll site's `Gemfile`:
    ```ruby
    gem "github-pages", group: :jekyll_plugins
    gem "jekyll-remote-theme"
    ```
2. And add these lines to your Jekyll site's `_config.yml`:
    ```yaml
    plugins:
        - jekyll-remote-theme

    remote-theme: xh5a5n6k6/plaintro
    ```

## Usage
### Configuration
All site configurations are set in the [\_config.yml](./_config.yml). The simplest way to use it is to copy the [\_config.yml](./_config.yml) to your Jekyll site, and then customize it.

### Top Header Bar
There are two main information sections shown in the header bar: navigation and social links.

- #### Navigation
    Top navigation are built from the menu list in the `_config.yml`. You can easily arrange the order and modify the contents.

    ```yaml
    menu:
      - {name: 'Home', url: '/'}
      - {name: 'Blog', url: '/blog/'}
      - {name: 'Portfolio', url: '/portfolio/'}
      - {name: 'Resume', url: '/resume.html'}
    ```

    **Note**: if you enable the blog page, be sure its url matches the `paginate_path` set in the `_config.yml`. (See [Blog](#blog) for more details)

- #### Social Links
    Social networks are built from the social list in the `_config.yml`. You can easily modify the contents and change icons, which can be found on [Font Awesome](https://fontawesome.com).

    ```yaml
    social:
      - {icon: 'github-square', link: 'URL/TO/YOUR/GITHUB/ACCOUNT'}
      - {icon: 'vimeo-square', link: 'URL/TO/YOUR/VIMEO/ACCOUNT'}
      - {icon: 'twitter-square', link: 'URL/TO/YOUR/TWITTER/ACCOUNT'}
      - {icon: 'linkedin', link: 'URL/TO/YOUR/LINKEDIN/ACCOUNT'}
    ```

### Default Page
Default is the most common layout used in plaintro. Every layout is based on it.

To use this layout, add these data in your file:
```yaml
---
layout: default
title: YOUR PAGE TITLE
---
```
And then write contents with Markdown.

### Blog
When using [jekyll-paginate](https://github.com/jekyll/jekyll-paginate), if you specify the `paginate_path` in the `_config.yml`, it will read in `/PATH/TO/YOUR/BLOG/index.html` and write the output to `/PATH/TO/YOUR/BLOG/page:num/`. Please refer to the [Jekyll docs for pagination](https://jekyllrb.com/docs/pagination/).

To use the blog layout, create a file named with `index.html` and add these data inside:
```yaml
---
layout: blog
title: Blog
---
```

### Post
Before using this layout, be sure the conventions in Jekyll when writing a post:
- Put it in the `./_posts` folder
- Name it with the date first like `2021-08-05-My-blog-post.md`

You can refer to the [Jekyll docs for writing posts](https://jekyllrb.com/docs/posts/).

Now to use the post layout, add these data in your post:
```yaml
---
layout: post
title: YOUR POST TITLE
author: POST AUTHOR
tags: [TAG-A, TAG-B, TAG-C]
---
```
And then write down your post contents.

### Archive
Plaintro provides the archive page implemented in pure [Liquid](https://shopify.github.io/liquid/). It now only supports yead-based archive.

To use this, simply create a file and add these data in it:
```yaml
---
layout: blog-archive
title: Archive
---
```

### Portfolio
Porfolio is a feature page with portfolio layout, it contains all include template contents user provided.

To use it in your file like `porfolio.html`, first add these data inside:
```yaml
---
layout: portfolio
title: Portfolio
---
```

Next, add contents to your portfolio page, plaintro provides two include templates to help you achieve it:
- Template for each category, you just need to edit the **title** blank with the category name. 
  For example, replace "CATEGORY NAME" with "Projects".

    ```yaml
    {% include /portfolio-category.html title="CATEGORY NAME" %}
    ```
- Template for each section (project), there are three blanks you need to edit: 
    - **description**: path to the short description of your section shown in the portfolio page.<br>
      For example, `/portfolio/section-a.md`. It should be noted that this path MUST be under the `./_includes/` folder, i.e., the actual path of the above example is `./_includes/portfolio/section-a.md`, but you can skip the leading `./includes` as the desciption path.
    - **image**: path to the cover image of your section.<br>
      For example, `/assets/images/section-a.jpg`.
    - **url**: path to your section page.<br>
      For example, `/portfolio/section-a.html`.<br><br>

    ```yaml
    {% include /portfolio-section.html
        description="/PATH/TO/SECTION/DESCRIPTION"
        image="/PATH/TO/SECTION/IMAGE"
        url="/PATH/TO/SECTION/PAGE"
    %}
    ```

To correctly use these templates, you can take [./portfolio/index.html](./portfolio/index.html) as a reference.

### Resume
To use resume layout in your file, simply add these data inside:
```yaml
---
layout: resume
title: Resume
---
```
Then you can take [resume.md](./resume.md) as a reference and write down the contents.

### Google Analytics
To track your website through [Google Analytics](https://analytics.google.com/analytics/web/), simply set the [Track ID](https://support.google.com/analytics/answer/7372977?hl=en) in your Jekyll site's `_config.yml`:
```yaml
google_analytics_id: UA-XXXXXXX-X
```
Or if you are using [Google Analytics 4](https://support.google.com/analytics/answer/10089681?hl=en), replace the [Track ID](https://support.google.com/analytics/answer/7372977?hl=en) with the [Measurement ID](https://support.google.com/analytics/answer/7372977?hl=en) in your Jekyll site's `_config.yml`:
```yaml
google_analytics_id: G-XXXXXXXX
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/xh5a5n6k6/plaintro. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Development
To set up your environment to develop this theme, run `bundle install`.

Your theme is setup just like a normal Jekyll site! To test your theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme. Add pages, documents, data, etc. like normal to test your theme's contents. As you make modifications to your theme and to your content, your site will regenerate and you should see the changes in the browser after a refresh, just like normal.

When your theme is released, only the files in `_layouts`, `_includes`, `_sass` and `assets` tracked with Git will be bundled.
To add a custom directory to your theme-gem, please edit the regexp in `plaintro.gemspec` accordingly.

## License
The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).