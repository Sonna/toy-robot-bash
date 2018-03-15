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

- [bash \- Pass command line parameters to a program inside the shell script \- Unix & Linux Stack Exchange]
  (https://unix.stackexchange.com/questions/304895/pass-command-line-parameters-to-a-program-inside-the-shell-script)

- [bash \- Read a file line by line assigning the value to a variable \- Stack Overflow]
  (https://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable)

- [bash \- How to detect if my shell script is running through a pipe? \- Stack Overflow]
  (https://stackoverflow.com/questions/911168/how-to-detect-if-my-shell-script-is-running-through-a-pipe)

-->
