# Dreck Data URI Plugin [![License](https://img.shields.io/github/license/sunruse/dreck-data-uri-plugin.svg)](https://github.com/sunruse/dreck-data-uri-plugin/blob/master/license) [![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)

Generates TypeScript exposing the content of files as data URIs.

## Dependencies

- NodeJS 10.19.0 or later.
- NPM 6.14.4 or later.
- NPX 6.14.4 or later.
- File.

All must be available on the PATH (e.g. `node --version`, `npm --version`, `npx --version` and `file --version` all print version strings when executed in a Bash terminal).

### Installing on Debian-based Linux distributions

These are available from most Debian-based Linux distributions' package managers; for example, they can be installed when running Ubuntu 20.04 LTS using the following command:

```bash
sudo apt-get install nodejs npm --yes
```

### Installing within GitHub Actions

Add an appropriate [actions/setup-node](https://github.com/actions/setup-node) action step **before** the `make` action step:

```yml
name: Continuous Integration
on: [push, pull_request]
jobs:
  main:
    runs-on: ubuntu-20.04
    steps:
    - uses: actions/checkout@v3
      with:
        submodules: true

    # Insert this block:
    ###############################
    - uses: actions/setup-node@v3
      with:
        node-version: 12
    ###############################

    - run: make --file ./submodules/dreck/makefile
      shell: bash
    - if: github.event_name == 'release' && github.event.action == 'created'
      uses: softprops/action-gh-release@v1
      with:
        files: dist/**
```

## Installation

Run the following in a Bash shell at the root of your project:

```bash
git submodule add https://github.com/sunruse/dreck-data-uri-plugin plugins/data-uri
```

## Input

This plugin converts each file in the `DRECK_DATA_URI_INPUT_PATHS` Make variable.

## Output

This plugin writes an equivalent TypeScript file for each input file.  For example, if `DRECK_DATA_URI_INPUT_PATHS` contained `./example/file-path.txt`, `./plugins/data-uri/generated/a/b-c.txt.ts` would be written to disk, which would contain the equivalent:

```typescript
const dataUriExampleFilePathTxt: `data:text/plain;charset=utf-8,f2wGBEr154m8h7Bcokd1aQ==` = `data:text/plain;charset=utf-8,f2wGBEr154m8h7Bcokd1aQ==`;
```

Their paths are listed in the `DRECK_DATA_URI_OUTPUT_TYPE_SCRIPT_PATHS` Make variable, space separated.
