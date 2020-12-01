FROM caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/abiosoft/caddy-exec \
    --with github.com/caddyserver/nginx-adapter \
    --with github.com/greenpau/caddy-auth-portal \
    --with github.com/greenpau/caddy-auth-jwt \
    --with github.com/greenpau/caddy-trace \
    --with github.com/hairyhenderson/caddy-teapot-module \
    --with github.com/lucaslorentz/caddy-docker-proxy/plugin/v2

FROM caddy:2.2.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
