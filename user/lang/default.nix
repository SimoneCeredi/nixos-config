{ config, pkgs, ... }:
{
  imports = 
  [
    # if some langs need a not trivial configuration
  ];
  
  home.packages = with pkgs; [
    # nix
    nixpkgs-lint
    nixpkgs-fmt
    nixfmt

    # c
    gcc
    gnumake
    cmake
    autoconf
    automake
    libtool

    # node
    nodejs

    # go
    go

    # rust
    rustup

    # java stuff
    jdk
    kotlin
    gradle
    scala_3
    sbt

    # erlang stuff
    erlang
    elixir
    gleam

    # ruby
    ruby

    # latex
    texlive.combined.scheme-full

  ];
}
