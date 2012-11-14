#!/usr/bin/env zsh

echo "Seed script beginning at $date"

# get curl installed
function {
    local curl_path=$(which_curl);
    if [[ -x $curl_path ]]; then
        echo "Good, you've got curl!"
        echo $(curl --version)
    else
        echo "You need curl installed. Trying to install now..."
        sudo aptitude install curl
    fi
}

# get puppet installed
function {
    local puppet_path=$(which puppet);
    if [[ -x $puppet_path ]]; then
        echo "Good, you've got puppet: $(puppet --version)"
    else
        echo "You need puppet installed. Trying to install now..."
        sudo aptitude install puppet
    fi

    # let puppet install packages needed for rvm
    echo "Now installing base packages with puppet. This should include all you need to get going with the rest of the seed."
    sudo puppet apply build_packages.pp
}

# get rvm installed
function {
    local rvm_path=$(which rvm)
    if [[ -x $rvm_path ]]; then
        echo "Good, you've got rvm!"
        rvm --version
    else
        echo "Installing RVM..."
        \curl -L https://get.rvm.io | zsh -s stable
    fi
}

# actually load rvm
source $HOME/.rvm/scripts/rvm

# actually install a ruby
echo "Installing ruby stable..."
rvm install ruby
echo "Looks like we've got $(ruby --version)"

# install gems needed by irbrc and config
function {
    local gems_to_install=(wirble hirb ansi)
    echo "Installing some needed gems: $gems_to_install"
    gem install $gems_to_install
}

# let rake do what it does best
function {
    echo "Handing off to $(rake --version) at $(date)"
    rake seed:full
}

echo "Looks like we're done at $(date)"
