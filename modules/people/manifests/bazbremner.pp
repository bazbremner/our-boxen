class people::bazbremner {
  include caffeine
  include chrome
  include dropbox
  include flux
  include gitx::dev
  include iterm2::colors::solarized_dark
  include iterm2::dev
  include notational_velocity::nvalt
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::unhide_library
  include sizeup
  include vagrant

  package {
    [
      'bash-completion',
      'cask',
      'emacs',
      'gpg',
      'jq',
      'sipcalc',
      'the_silver_searcher',
      'tree',
      'tmux',
     ]:
     ensure => latest,
  }

  package {
    [
      'wget',
     ]:
     ensure => present,
  }

  boxen::osx_defaults { "Disable 'natural scrolling'":
    key    => 'com.apple.swipescrolldirection',
    domain => 'NSGlobalDomain',
    value  => 'false',
    type   => 'bool',
  }

  $home = "/Users/${::luser}"

  repository { "${home}/.emacs.d":
    source => 'git@github.com:bazbremner/dot-emacs.git',
  }

}