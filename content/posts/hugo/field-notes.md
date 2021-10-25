---
title: "Field Notes"
date: 2021-10-22T17:20:22-06:00
draft: false
---

# installed

- used homebrew
    - `brew install hugo`
- created a new site
    - `hugo new site <site_name>`
- 

# theme configuration

### variables
`.Site`, `.Site.Params`, `.Site.Pages` all are variables. These may have additional variables nested inside. Some are standard with Hugo and other are set in the `config.toml`.

So most if not all site configuration that is used in logical statements within the various template files can be found in the `.toml` or may be built-in with Hugo.

### template structure
themes are installed in site/themes
site/themes/base_theme_dir

base_theme_dir contains the folder: `layouts`
inside we find `index.html`. This is where the basic layout decisions are made