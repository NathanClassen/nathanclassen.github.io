FROM nathanclassen/hugo as builder

WORKDIR /usr/site

COPY . .

RUN hugo

FROM nginx

COPY --from=builder /usr/site/public /usr/share/nginx/html