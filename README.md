# seed.zsh

Scripts and config needed to get a machine setup in the way I like. I
want to try and use the best tools for each part of the job.

## Rationale

Many tools such as [rvm](https://rvm.io) provide a very helpful
[installer script](https://rvm.io/rvm/install/) to assit in getting
started. As I need to get a machine up and running with my favorite
conveniences from time to time, my general laziness has encouraged me
to work on an automated solution to this. I could have done all of
this by hand but it seemed prudent to use the wealth of awesome tools
already in existence to configure systems in various ways.

## Features


I've got this configured such that I can pull in this script (via a
launcher I keep hosted) and let it do its thing to delegate to the
right tool for the right job.

Things that this depends on to get started:

* The OS: [Debian](http://www.debian.org/)
  * Ideally upgraded to testing and with all core packages up to date
  * A user with sudo powers
* The shell:[ZSH](http://www.zsh.org/)

Things which this script will install on its own to perform various tasks:

* For pulling in code: [git](http://git-scm.com/)
* For installing packages: [puppet](http://puppetlabs.com/)
* For installing and managing ruby: [rvm](http://rvm.io)
* For structuring and executing tasks: [rake](http://rake.rubyforge.org/)

In short, we use ZSH to install just enough to install puppet to
install just enough to install rvm and ruby to install just enough to
then pass control to rake tasks.

## Thoughts for the future

I'd like to look into the wisdom of using something like
[thor](https://github.com/wycats/thor) to manage a bit more than just
using rake and also delegating even more to puppet. I also need to
tighten up better integration with my
[dotfiles](https://github.com/yonkeltron/dotfiles).
