# Rack::PushstateStatic

This is a rack middleware for serving a SPA (for example with AngularJS).

With pushState(html5), it is convenient to get `index` file content when accessing unknown URL paths.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-pushstate-static', git: 'git@github.com:literalice/rack-pushstate-static.git'
```

And then execute:

    $ bundle

## Usage

You can use it in your `config.ru` like this.

```ruby
require 'rack/pushstate_static'
use Rack::PushstateStatic, excludes: %w(/api/v1 /api/v2)
```

1. If a accessed url is excluded using the `excludes` option, the middleware passes the request to the next on middleware stack.
2. If a accessed url path matches existing file path within `publc` directory, it returns the file as a response.
3. Otherwise it returns `index.html` within `public` directory as a response.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
