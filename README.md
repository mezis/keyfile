# keyfile

A key-file store over HTTP, as a no-frills alternative to Amazon S3.

Keyfile can be useful when all you have is [curl](http://curl.haxx.se/) on your
command line and cannot use the heavier S3 client libraries.

It provides 3 endpoints:

- `POST` a file to `/:key` as the `filedata` parameter to save it.
- `GET` from `/:key` to get the file back (through a redirection).
- `GET` from `/pulse` to check the server is alive.

All three endpoints are protected by HTTP Digest authentication.


## Hosted version

I (@mezis) host and use an instance of Keyfile at
http://keyfile-production.herokuapp.com

I'm happy to hand out credentials for testing purposes, just drop me a line.


## Installation

Just deploy the application to Heroku. Make sure you have a database linked to
your app, that `DATABASE_URL` is set properly, and that you run the migrations:

    $ git clone http://github.com/mezis/keyfile.git
    $ cd keyfile
    $ heroku apps:create {myapp}
    $ git push heroku
    $ heroku run rake db:migrate

You'll need to configure a few environment variables, following the example in
`.env`; here are some sensible settings.

    $ heroku config:set       \
        UNICORN_KEEPALIVE=20  \
        UNICORN_THREADS=2     \
        UNICORN_TIMEOUT=60    \
        UNICORN_WORKERS=2

Finally, you need to setup credentials (remember that all endpoints are
protected by HTTP Digest). They take the form of a JSON hash of
username/password keys:

    $ heroku config:set       \
        KEYFILE_CREDENTIALS='{"user1":"secret1","user2":"secret2"}'

You're all set!


## License

Released under the MIT licence.
Copyright (c) 2013 HouseTrip Ltd.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
