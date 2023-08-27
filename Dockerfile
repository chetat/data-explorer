FROM apache/superset:2.1.0-dev
USER root

RUN apt-get update && \
    apt-get install --no-install-recommends -y firefox-esr

ENV GECKODRIVER_VERSION=0.29.0
RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v${GECKODRIVER_VERSION}/geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz && \
    tar -x geckodriver -zf geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz -O > /usr/bin/geckodriver && \
    chmod 755 /usr/bin/geckodriver && \
    rm geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz

RUN pip install --no-cache gevent psycopg2 redis
COPY ./superset/static/assets /app/superset/static/assets

USER superset