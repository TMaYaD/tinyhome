FROM ruby:3.0.3
# Suppress the keyword argument warnings https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/
# ENV RUBYOPT='-W:no-deprecated -W:no-experimental'

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn

RUN gem install bundler; \
# throw errors if Gemfile has been modified since Gemfile.lock
    bundle config --local frozen 'true'; \
    bundle config --local deployment 'true'; \
    bundle config --global path $GEM_HOME;

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN yarn install --check-files

RUN bundle exec rake assets:precompile

ENTRYPOINT [ "bundle", "exec"]
CMD ["rails", "server"]
