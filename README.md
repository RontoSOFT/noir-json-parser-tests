[![CI/CD](https://github.com/rontosoft/noir-json-parser-tests/actions/workflows/main.yml/badge.svg)](https://github.com/rontosoft/noir-json-parser-tests/actions/workflows/main.yml)

# noir-json-parser-tests

Welcome!

This is a library of tests covering the deserialization functionality provided by the [`noir-json-parser`](https://github.com/rontosoft/noir-json-parser) library.

Written in the [Noir programming language](https://noir-lang.org/), the tests are designed to ensure the correct parsing and conversion of JSON data.

<br>

# Setup

<br>

1. Create a folder named `noir-json-parser`. This will be the parent of all projects (the library, tests and optionally the examples).

    ```sh
    mkdir noir-json-parser
    cd noir-json-parser
    ```

<br>

2.  - Clone the library repository in the same parent folder under the name `lib`.

    ```sh
    git clone https://github.com/RontoSOFT/noir-json-parser lib
    ```

    <br>

    - Clone this repository in the same parent folder under the name `tests`.

    ```sh
    git clone https://github.com/RontoSOFT/noir-json-parser-tests tests
    ```

<br>

3. Install [Nargo](https://noir-lang.org/getting_started/nargo_installation), the [Noir language](https://noir-lang.org/) compiler, by sourcing a [release build](https://github.com/noir-lang/noir/releases) to the version specified in [Nargo.toml](https://github.com/RontoSOFT/noir-json-parser/blob/main/Nargo.toml#L5) by enabling and running the [setup script](https://github.com/RontoSOFT/noir-json-parser/blob/main/scripts/setup.sh).

    ```sh
    chmod +x ./lib/scripts/setup.sh
    ./lib/scripts/setup.sh
    ```

<br>

4.  Run the `noir test` command in the `tests` project directory.

    ```sh
    cd tests
    nargo test --show-output --silence-warnings
    ```

<br>
<br>

## Overview

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
