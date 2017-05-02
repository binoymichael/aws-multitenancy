# Install ruby and other dependencies
sudo apt-get update
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev postgresql-client libpq-dev nodejs upstart-sysv

cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

# Install ruby and bundler
rbenv install -v 2.3.4
rbenv global 2.3.4

gem install bundler


bundle binstubs puma --path /usr/local/bin


# App specific
# git clone repo
# bundle install


# export vars
# DATABASE_URL="postgres://myuser:mypass@localhost/somedatabase"
# SECRET_KEY_BASE=

# RAILS_ENV=production bundle exec rake db:migrate
# configure puma

mkdir -p shared/pids shared/sockets shared/log

