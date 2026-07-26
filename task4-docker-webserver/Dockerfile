# CodeAlpha Task 4 — Web Server using Docker
FROM nginx:1.27-alpine

# Remove default Nginx page and serve our site
RUN rm -rf /usr/share/nginx/html/*

COPY html/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null || exit 1

CMD ["nginx", "-g", "daemon off;"]
