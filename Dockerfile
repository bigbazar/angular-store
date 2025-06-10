# Étape de build
FROM node:18-alpine as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build -- --configuration production

# Étape de production
FROM docker.io/library/nginx:alpine
COPY --from=build /app/dist/angular-store/browser /usr/share/nginx/html
# Remplacez la config NGINX par défaut
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Corrigez les permissions
RUN chown -R nginx:nginx /usr/share/nginx/html
# Configuration NGINX optimisée pour les SPAs
RUN echo 'server { \
    listen 80; \
    location / { \
        root /usr/share/nginx/html; \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf
EXPOSE 80