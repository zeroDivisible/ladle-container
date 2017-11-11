What's this?
===============

This is a simple Docker container which is preconfigured with [Ladle](https://github.com/NUBIC/ladle)
running on it.

Ladle is a great development tool, replacement for a real LDAP server, fully
under your control.

*Warning*: This is a really hacky, "let's make it work" Docker Container.

Usage
=====
tl;dr to start the container, pass the path to a locally existing LDIF file
and an environmental variable containing the domain for that LDIF mapping:

```
docker run --name ladle \
           -p '8389:8389' \
           -v /full/path/to/local/ldif.file:/data/users.ldif \
           -e LADLE_LDAP_DOMAIN='dc=example,dc=com' \
           -d zerodivisible/ladle
```


Longer explanation
--------------------

To start `ladle` correctly, you need to pass two commands when running `docker` commands:

* *This is a mandatory flag*, there's no default configuration in place.
  An LDIF file, which is telling LDAP about the users which it should serve.
  This can be achieved by using the `-v` flag i.e.

```
    -v /full/path/to/local/ldif.file:/data/users.ldif
```

  Target file *must* equal `/data/users.ldif` as this is where Ladle will be looking for
  it.

* pass `LADLE_LDAP_DOMAIN` environmental variable which will tell the domain mapping for
  the file above. If ommited, this defaults to `dc=example,dc=com`.
