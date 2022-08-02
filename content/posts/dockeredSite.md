---
title: "DockeredSite"
date: 2022-08-01T23:08:01-06:00
draft: true
---

no longer wish to host my site on Github page, as I want to understand how it is operating

want to build and serve the site in a container, as I don't want to have to build the site, copy it over into a container and then serve the static content

the idea is, copy my project into a container, use Hugo to build the site (will need to have hugo installed in the container), and finally, get an
nginx server running to serve the site

first I spin up a conteiner based on <\image>
    chose this one because it is small, and would be easy enough to install Hugo into the container

now, I know this is not typically done, by I created my Hugo equipped image via `docker commit` 
    a note on this method. Not exactly repeatable

with this image available I use it as the base image for the build phase.

buld the site

then for the serve phase, base off the nginx image and copy all of the static assets from the previous phase:

`COPY --from=builder /usr/site/public /usr/share/nginx/html`

with the assets located in `/usr/share/nginx/html` the nginx container will start up the server by default and serve the files from the former directory