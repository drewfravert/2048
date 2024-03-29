# 2048
[<img src="assets/static/images/icon.svg" width="25%" height="auto" align="right" valign="top">](https://ex2048.gigalixirapp.com/)

![Build Status](https://img.shields.io/github/workflow/status/drewfravert/2048/Build)
![Release Version](https://img.shields.io/github/v/release/drewfravert/2048)
![Dependency Status](https://img.shields.io/david/drewfravert/2048?path=assets)
![Development Dependency Status](https://img.shields.io/david/dev/drewfravert/2048?path=assets)
![License](https://img.shields.io/github/license/drewfravert/2048)

This is a port of the popular tile game by [Gabriele Cirulli](https://www.gabrielecirulli.com/) written in [Elixir](https://elixir-lang.org/). This repo is a medium for me to experiment with Elixir, [Phoenix](https://phoenixframework.org/) & [OTP](http://erlang.org/doc/system_architecture_intro/sys_arch_intro.html), to demonstrate my engineering abilities, and so my wife can play her favorite game ad-free.

The game uses LiveView, which isn't ideal for this type of game, but wanted to use this as a sandbox for my personal learning and enjoyment. That said, if you have a decent internet connection, you shouldn't really notice any latency.

## Quick Start
Want to go ahead and jump in? [Play the game online](https://ex2048.gigalixirapp.com/).

If you would prefer to run the game locally:

  * Clone this repo with `git clone git@github.com:drewfravert/2048.git`
  * Setup the application environment with `mix setup`
  * Add `game.local` as an alias to `localhost` in your `/etc/hosts` file
  * Start the server with `mix phx.server`
  * Visit [`https://game.local:4001`](https://game.local:4001) in your browser.

## Feature Roadmap
  * Leaderboard
  * Recap of played games
  * Live observation of ongoing games

## Questions / Requests
If you have questions or would like to request a new feature, you may reach me at [drew@fravert.org](mailto:drew@fravert.org).

## License
Licensed under the [MIT License](LICENSE.txt).
