![2048](assets/static/images/readme.png)

# 2048
![Build Status](https://img.shields.io/github/workflow/status/drewfravert/2048/Build)
![Release Version](https://img.shields.io/github/v/release/drewfravert/2048)
![Dependency Status](https://img.shields.io/david/drewfravert/2048?path=assets)
![Development Dependency Status](https://img.shields.io/david/dev/drewfravert/2048?path=assets)
![License](https://img.shields.io/github/license/drewfravert/2048)

This is a port of the popular tile game by [Gabriele Cirulli](http://gabrielecirulli.com/) written in [Elixir](https://elixir-lang.org/). Mostly, this is a means for me to learn and experiment with the language the [Phoenix](https://phoenixframework.org/) framework, but also so that my fiancé can play her favorite game without advertisements. 😝

The game uses LiveView, which obviously isn't ideal for this type of game, but, again, this is a sandbox for my personal learning and enjoyment. That said, if you have a decent internet connection, you likely won't notice any serious latency.


## Quick Start
To start the game:

  * Clone this repo with `git clone git@github.com:drewfravert/2048.com.git`
  * Install dependencies with `mix setup`
  * Generate a self-signed SSL certificate with `mix phx.gen.cert`
  * Add `game.local` as an alias to `localhost` in your `/etc/hosts` file
  * Start Phoenix endpoint with `mix phx.server`

Now visit [`https://game.local:4001`](https://game.local:4001) from your browser.


## Feature Roadmap
  * Leaderboard
  * Recap of played games
  * Live observation of ongoing games


## Requests / Questions
If you happen to find yourself playing this game and want to request a new feature or you have questions, you can reach me at [drew@fravert.dev](mailto:drew@fravert.dev).


## License
Licensed under the [MIT License](LICENSE.txt).
