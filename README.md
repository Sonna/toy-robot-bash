# Bash Hello World project

## Run with Docker

```console
    $ docker run \
        -v $(pwd):/tests \
        --entrypoint "bash" \
        dduportal/bats:latest \
        /tests/bin/test

    $ docker build --tag local/bats . \
      \
      docker run \
      -v $(pwd):/build \
      local/bats \
      bash -c "cd /build && bin/test"
```

<!--

# References:
- [bats\-core/bats\-core: Bash Automated Testing System 2017]
  (https://github.com/bats-core/bats-core)

- [bash \- How to call shell script from another shell script? \- Stack
  Overflow]
  (https://stackoverflow.com/questions/8352851/how-to-call-shell-script-from-another-shell-script)

- [dduportal/bats \- Docker Hub]
  (https://hub.docker.com/r/dduportal/bats/)

- [bats\-core/bats\-core: Bash Automated Testing System 2017]
  (https://github.com/bats-core/bats-core)

-->
