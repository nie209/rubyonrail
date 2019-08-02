FROM ruby:2.5
WORKDIR /blog_app
COPY . /blog_app/
COPY Gemfile Gemfile.lock /blog_app/
RUN gem update
RUN bundle install
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
