# stuar.tc development environment

stuar.tc development environment is a developer friendly work environment for
the stuar.tc project.

## Install

The get up and running stuar.tc development environment, you simply need to
clone the repository and run the Makefile install and up commands.

```bash
# Clone repository
$ git clone git@github.com:Decipher/stuar.tc-dev.git

# Change directory
$ cd stuar.tc-dev

# Install
$ make install
```

## Usage

When stuar.tc development environment is running, the servers are accessible at
the following URLs:

| Service | URL | Local |
| --- | --- | --- |
|**www** | http://stuar.tc.localhost | http://localhost:8080 |

## Commands

stuar.tc development environment comes with a Makefile for controlling the
environment.

It is recommended that you run `make help` for a list of the commands.

The most important commands are:

```bash
# Install
#
# All dependencies will be installed and the servers will be started.
$ make install

# Up
#
# All servers will be started, assuming they have been installed, logs will be
# displayed.
#
# CTRL-C can be used to exit logs, but servers will still be running.
$ make up

# Down
#
# All servers will be stopped.
$ make down
```
