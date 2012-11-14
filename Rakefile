
namespace :seed do
  desc "Execute a full seed of this system with configuration and the like"
  task :full => ['seed:puppet:utility_packages', 'seed:puppet:security_packages', 'seed:config:all']


  namespace :puppet do
    desc 'Use puppet to install utility packages'
    task :utility_packages do
      sh 'sudo puppet apply utility_packages.pp'
    end

    desc 'Use puppet to install security packages and config'
    task :security_packages do
      sh 'sudo puppet apply security_packages.pp'
    end
  end

  namespace :config do
    desc "Run all config tasks"
    task :all => ['seed:config:oh_my_zsh', 'seed:config:dotfiles']

    desc 'Install oh-my-zsh'
    task :oh_my_zsh do
      puts "Installing oh-my-zsh"
      if Dir.exist File.join(Dir.home, '.oh_my_zsh')
        puts "Looks like you've already got oh-my-zsh installed! Never mind, then."
      else
        sh 'git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh'
      end
    end

    desc 'Clone dotfiles repo and run symlinking script'
    task :dotfiles do
      puts "Configuring dotfiles..."
      dotfiles_path = File.join(Dir.home, 'dotfiles')
      before_dir = Dir.pwd

      if Dir.exist dotfiles_path
        puts "Looks like you've already got a dotfiles folder. We'll just make sure we've got the latest."
        Dir.chdir dotfiles_path
        sh 'git pull'
      else
        Dir.chdir Dir.home

        sh 'git clone git://github.com/yonkeltron/dotfiles.git'
        Dir.chdir dotfiles_path
        sh 'zsh link.zsh'
      end

      Dir.chdir before_dir
    end
  end
end

task :default => 'seed:full'
