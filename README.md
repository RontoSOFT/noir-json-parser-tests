[![CI/CD](https://github.com/rontosoft/noir-json-parser-tests/actions/workflows/main.yml/badge.svg)](https://github.com/rontosoft/noir-json-parser-tests/actions/workflows/main.yml)

# noir-json-parser-tests
A library of tests covering the deserialization functionality provided by the [`noir-json-parser`](https://github.com/rontosoft/noir-json-parser) library.

The tests, written in the Noir programming language, are designed to ensure the correct parsing and conversion of JSON data.

<br>

# Setup

<br>

1. Create a folder named `noir-json-parser`. This will be the parent of both projects (the library and these examples).

    ```sh
    mkdir noir-json-parser
    cd noir-json-parser
    ```

<br>

2. *[noir-json-parser](https://github.com/rontosoft/noir-json-parser) is **accessible***

    Clone the [library repo](https://github.com/RontoSOFT/noir-json-parser) in the same parent folder under the name `lib`.

    ```sh
    git clone https://github.com/RontoSOFT/noir-json-parser lib
    ```

<br>

3. Clone this repository in the parent folder under the name `tests`.

    ```sh
    git clone https://github.com/RontoSOFT/noir-json-parser-tests tests
    ```

<br>

4. Install the Noir language [compiler](https://github.com/noir-lang/noir/releases) (see [here](https://noir-lang.org/getting_started/nargo_installation)). The version used for this project is specified in [Nargo.toml](https://github.com/RontoSOFT/noir-json-parser/blob/main/Nargo.toml).

<br>

5.  A) *[noir-json-parser](https://github.com/rontosoft/noir-json-parser) is **private***

    Create a PR with updated tests to see the results from the [GitHub action](https://github.com/RontoSOFT/noir-json-parser-tests/blob/main/.github/workflows/main.yml) set to run on PRs to main.

    See [this PR](https://github.com/RontoSOFT/noir-json-parser-tests/pull/1) for an example.

    <br>

    B) *[noir-json-parser](https://github.com/rontosoft/noir-json-parser) is **accessible***

    Run the `noir test` command in the `tests` project directory.

    ```sh
    cd tests
    nargo test --show-output --silence-warnings
    ```


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

<br>

- [`convert`](https://github.com/RontoSOFT/noir-json-parser-tests/blob/main/src/convert.nr) focuses on the conversion aspect of JSON data into different types. It includes tests for converting various flavors of `[u8; N]` instances to native types, such as `bool`, `Field`, byte-strings, array-lists (`[[u8]]`), as well as the structs introduced by `noir-json-parser`, namely [`Object`](https://github.com/RontoSOFT/noir-json-parser/blob/main/src/lib.nr#L12) and [`JSON`](https://github.com/RontoSOFT/noir-json-parser/blob/main/src/lib.nr#L18).

<br>

## Contributing

Get in touch with the owners via [Noir Discord](https://discord.gg/JtqzkdeQ6G) to get approved as a collaborator. Once added, you can create a PR to the `main` branch with your custom tests and the GitHub action will use them against the private JSON parsing library.

<br>

## Licensing

This project is yet unlicensed.
