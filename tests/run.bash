#!/usr/bin/env bats

@test "first run" {
  repository=$(pwd)
  temporaryDirectory=$(mktemp -d)
  expected=$temporaryDirectory/expected
  cp -r ./tests/first-run/expected/. $expected
  mkdir -p $expected/plugins/dreck
  cp -r ./plugins/dreck $expected/plugins
  mkdir -p $expected/plugins/data-uri
  cp -r . $expected/plugins/data-uri
  actual=$temporaryDirectory/actual
  cp -r ./tests/first-run/input/. $actual
  mkdir -p $actual/plugins/dreck
  cp -r ./plugins/dreck $actual/plugins
  mkdir -p $actual/plugins/data-uri
  cp -r . $actual/plugins/data-uri
  cd $actual

  make --file ./plugins/dreck/makefile

  cd $repository
  diff --brief --recursive $actual $expected
  rm -rf $temporaryDirectory
}
