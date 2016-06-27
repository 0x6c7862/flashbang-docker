FROM node:6.2.1

RUN git clone --depth 1 https://github.com/cure53/Flashbang /app
COPY index.html /app/index.html
RUN apt-get update \
  && apt-get install -y openjdk-7-jre unzip \
  && npm install -g grunt-cli http-server \
  && cd /app/shumway \
  && git submodule init \
  && make bootstrap \
  && apt-get clean

EXPOSE 80

CMD ["http-server", "-p", "80", "-d", "False", "/app"]
