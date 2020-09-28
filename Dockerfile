FROM ruby:2.5 as BASE

ENV APP=/usr/src/app/ \
  BUILD_PACKAGES="build-essential cmake pkg-config git-core" \
  RUNTIME_PACKAGES="libpq-dev tzdata file nodejs yarn wkhtmltopdf libfontconfig1 libxrender1 imagemagick"

WORKDIR ${APP}

RUN ln -sf /usr/share/zoneinfo/Mexico /etc/localtime && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y ${RUNTIME_PACKAGES}

ARG PORT=3000
EXPOSE ${PORT}
ENTRYPOINT ["bin/entrypoint"]
CMD ["bin/rails", "server", "-b", "0.0.0.0"]

FROM BASE as DEVELOPMENT
RUN apt-get -y install ${BUILD_PACKAGES}

FROM DEVELOPMENT as PRE-PRODUCTION
COPY Gemfile* $APP/
ARG BUNDLE_GEMS__CONTRIBSYS__COM
RUN gem install bundler -v 2.0.2 && \
  bundle install --retry 4 --jobs 2 --without "development test" && \
  rm -rf /usr/local/bundle/cache/*.gem && \
  find /usr/local/bundle/gems/ -name "*.c" -delete && \
  find /usr/local/bundle/gems/ -name "*.o" -delete

FROM BASE as PRODUCTION
COPY --from=PRE-PRODUCTION /usr/local/bundle/ /usr/local/bundle/
COPY . $APP/
