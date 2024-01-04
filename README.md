# raetsel

This is a collection of challenging abstract problems/puzzles together with Ruby implementations of their solutions.

If you don't want to spoil yourself, you should refrain from looking at the source code before solving the problems. I will attempt to keep at least the top-level file names within each folder so generic that they don't give any hints.

Each top-level folder contains a `README.md` with the problem description.

**[SPOILERS]** It also contains a `SPOILERS.md` with a short description of the solution (look at the source code for more details) and instructions for executing the code. It might also link to screenshots of the output. Don't peek before giving the problems an honest try.

## Setup

#### Install rbenv

I recommend installing Ruby via a version manager such as `rbenv` (Ruby only) or `asdf` (many different tools). Instructions for `rbenv` follow.

Install `rbenv` and `ruby-build` (instructions for Ubuntu, for other distros check the docs):
```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo 'eval "$(~/.rbenv/bin/rbenv init - bash)"' >> ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

apt-get install autoconf bison patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
```

#### Setup this project

Install Ruby (the version is determined by the file `.ruby-version`):
```
rbenv install
```

Install bundler:
```
gem install bundler
```

Install gem dependencies (the gems and their versions are determinded by the files `Gemfile` and `Gemfile.lock`):
```
bundle
```
