FROM nginx:1.27-alpine
# Railway fournit la variable PORT ; nginx la lit via le template ci-dessous
ENV PORT=8080
COPY default.conf.template /etc/nginx/templates/default.conf.template
# Pages du site (ajoutez d'autres dossiers ici si besoin, ex. : COPY images/ /usr/share/nginx/html/images/)
COPY *.html swam.css /usr/share/nginx/html/
