#!/usr/bin/env zsh

echo "Seed script beginning at $date"

# get curl installed

function {
    packages_to_install=(curl puppet);
    package_list="";

    for package in $packages_to_install; do
        local package_path=$(which $package);

        echo

        if [[ -x $package_path ]]; then
            echo "Good, you've got $package installed:"
            echo $($package --version)
        else
            echo "You need $package installed. We'll install it."
            package_list+="$package "; # KEEP the trailing space, please.
        fi
    done

    if [[ -n "$package_list" ]]; then
        echo "You need to install $package_list so we'll do that now."
        sudo aptitude install $package_list
    else
        echo "Nothing to install, looks like you've got all you need.";
    fi
}

# let puppet install packages needed for rvm
echo "\n ===> Build-related packages"
function {
    echo "Now installing base packages with puppet. This should include all you need to get going with the rest of the seed."
    sudo puppet apply build_packages.pp
}

# get rvm installed
echo "\n ===> rvm"
function {
    local rvm_path=$HOME/.rvm
    if [[ (-d $rvm_path) && (-x $rvm_path/scripts/rvm) ]]; then
        echo "Good, you've got rvm!"
        echo $(rvm --version)
    else
        echo "Installing RVM..."
        \curl -L https://get.rvm.io | zsh -s stable
    fi
}

# actually load rvm
source $HOME/.rvm/scripts/rvm

# actually install a ruby if needed
echo "\n ===> ruby"
function {
    if [[ -z $(rvm list default) ]]; then
        echo "I think we need to install a ruby!"
        rvm install ruby
    fi

    echo "Looks like we've got $(ruby --version)"
}

# install gems needed by irbrc and config
echo "\n ==> gems"
function {
    gems_to_install=(wirble hirb ansi)
    echo "Installing some needed gems: $gems_to_install"
    gem install $gems_to_install
}

# let rake do what it does best
echo "\n ==> rake"
function {
    echo "Handing off to $(rake --version) at $(date)"
    rake seed:full
}
echo
echo "Looks like we're done at $(date)"
