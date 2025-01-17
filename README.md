## aoc-template
This is a template for [Advent of Code](https://adventofcode.com/) ObjectScript.

# Intro

I copied this from the Intersystems github repo: https://github.com/intersystems-community/aoc-objectscript-template

# To Run

Make sure the iris container is running:

```
$ docker-compose up -d
```

# To execute a day

```
$ docker-compose exec iris iris session iris
USER>w ##class(dc.aoc2016.Day1).Run()
```