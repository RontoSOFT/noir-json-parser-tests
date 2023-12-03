[![CI/CD](https://github.com/rontosoft/noir-json-parser-tests/actions/workflows/main.yml/badge.svg)](https://github.com/rontosoft/noir-json-parser-tests/actions/workflows/main.yml)

# Introduction

Greetings and salutations!

Behold, a compendium of tests venturing into the realms of deserialization magic wielded by the venerable [`noir-json-parser`](https://github.com/rontosoft/noir-json-parser) library.

Crafted in the enigmatic 🌌[Noir](https://noir-lang.org/) programming language, these tests embark on a cosmic journey to guarantee the impeccable parsing and transformation of JSON data.

Come hitch a ride with us through the [Aztec](https://docs.aztec.network/) ZK-rollup galaxy of data! 🚀📡

<br>

# Setup

<br>

Refer to the `noir-json-parser` [setup instructions](https://github.com/RontoSOFT/noir-json-parser/blob/main/README.md#setup).

<br>
<br>

# Overview

The tests are organized into two modules:

- [`parse`](https://github.com/RontoSOFT/noir-json-parser-tests/blob/main/src/parse.nr) focuses on the parsing aspect of JSON data.

    This module checks the parsability of a JSON string value in three different scenarios:
    - single value tests (`parse/value` folder)
    - property value tests (`parse/property` folder)
    - nested object value tests (`parse/nested` folder)

    The scenarios are structured around the five JSON value types: `object`, `array`, `string`, `number`, and `literal`.

    In each of these folders, the `number` tests are split up into three files (`number.nr`, `exponent.nr`, and `fractional.nr`) to ease development.

    The scenarios further include `whitespace` and `escaped` character tests.

    The `utils.nr` file contains wrappers to ease testing of specific values in these scenarios.

<br>

- [`convert`](https://github.com/RontoSOFT/noir-json-parser-tests/blob/main/src/convert.nr) focuses on the conversion aspect of JSON data into native types. It includes tests for converting various flavors of `[u8; N]` instances to native types, such as `bool`, `Field`, byte-strings, array-lists (`[[u8]]`), as well as the structs introduced by `noir-json-parser`, namely [`Object`](https://github.com/RontoSOFT/noir-json-parser/blob/main/src/lib.nr#L12) and [`JSON`](https://github.com/RontoSOFT/noir-json-parser/blob/main/src/lib.nr#L18).

<br>
<br>

# Contributing

Get in touch with the owners via [Noir Discord](https://discord.gg/JtqzkdeQ6G) to get approved as a collaborator.

Use the hashtag `noir-json-parser`.
