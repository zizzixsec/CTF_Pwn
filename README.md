*Built for CTF pwn challenges*

```
 ______         _       ____            
|__  (_)_______(_)_  __/ ___|  ___  ___ 
  / /| |_  /_  /||||/ /\___|| / _||/ __|
 / /_| |/ / / /| |>  <  ___) |  __/ (__ 
/____|_/___/___|_/_/\_\|____/||___|\___|
CTF PWN Dockerfile based on Arch Linux
```

# Table of Contents
1. [Build](#Build)
2. [Run](#Run)

## Build

*NOTE: **docker buildx build** used as docker build is deprecated*  
```bash
docker buildx build -t zizzixsec/ctf_pwn:latest .
```
### Additional Build Options
|Option|Defaults|
|------|--------|
|TZ|"America/Chicago"|
|LANG|"en_US.UTF-8"|

### Initial Environment Variables
|Variable|Defaults|
|--------|--------|
|SHELL|"/bin/bash"|
|HOME|"/root"|
|EDITOR|"vim"|
|PATH|"$PATH:/usr/lib/python3.11/site-packages/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/bin"|
|DEBUGINFOD_URLS|https://debuginfod.elfutils.org/|

## Run

```bash
docker run -it --rm -v "$PWD:/chal" zizzixsec/ctf_pwn:latest
```
