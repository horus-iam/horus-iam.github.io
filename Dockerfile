FROM node:14 as BUILDER

RUN mkdir -p /usr/src/app
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN git config --system url."https://github".insteadOf "git://github"
RUN npm install --only=prod
RUN npm install
RUN npm run build
RUN npm run publish

FROM httpd:2.4
WORKDIR /usr/local/apache2/htdocs/
COPY --from=BUILDER /usr/src/app/site /usr/local/apache2/htdocs/
RUN chmod -R 755 /usr/local/apache2/htdocs/
